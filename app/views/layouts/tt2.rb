#! /usr/bin/env ruby
begin
require 'time'
require 'socket'
require 'bunny'

port = 8904
server = TCPServer.new port
powers = Hash.new

is_iot_box=true

def command(function, mark, params=nil)
  prefix = "ffff"
  suffix = "ff00"
  function = function || "00"
  mark = mark || "00"
  params = params || "000000000000"
  return prefix + function + mark + params + suffix
end

def command_to_hexadecimal(string)
  string = string.strip
  if string.length == 35
    return (string.split(' ').map {|number| number.hex}).pack('C*')
  elsif string.length == 24
    a = string.scan(/.{1,2}/)
    return (a.map {|number| number.hex}).pack('C*')
  else
    a = string.gsub(' ','').scan(/.{1,2}/)
    return (a.map {|number| number.hex}).pack('C*')
  end
rescue
  return 1
end

# 1.1
def get_machine_mark
  # ffff0101000000000000ff00
  #return command(function = '01', mark = '01')
  return command(function = '01', mark = '14')
end
# 6.2
def io_input_set_enable_switch
  return "ffff1628f00000000000ff00"
end

# 3.2
def set_subcard_push_freq(interval=30)
  params = interval.to_s(16).rjust(4,'0') + '00000000'
  return command(function = '40', mark = '25', params = params)
  # ffff4025012c00000000ff00
end


# 4.2
def power_output_set_power_monitor_freq(port, interval)
  params = port.to_s.rjust(2, '0') + interval.to_s(16).rjust(4, '0') + '000000'
  return command(function = '0a', mark = '25', params)
  # ffff0a25010019000000ff00
end

# 4.4
def power_output_set_safe_threshold(port, current)
  params = port.to_s.rjust(2, '0') + current.to_s(16).rjust(2, '0') + '00000000'
  return command(function = '0a', mark = '26', params = params)
  # ffff0a26016400000000ff00
end

# 5.2
# interval 10..300
def power_input_set_monitor_freq(interval)
  params = interval.to_s(16).rjust(4, '0') + '00000000'
  return command(function = '0d', mark = '25', params = params)
  # ffff0d25012c00000000ff00
  # 不识别的标识
end

  #14.3获取统一查询状态当前状态
def get_tongyi_chaxun_current_state
  return command(function = "36", mark = "14")
end

def init_client_rpc(client)

  client.write(command_to_hexadecimal(io_input_set_enable_switch()))
  sleep(0.1)
  client.write(command_to_hexadecimal(set_subcard_push_freq(30)))
  sleep(0.1)
  for i in 1..3
    client.write(command_to_hexadecimal(power_output_set_power_monitor_freq(i,30)))
    sleep(0.1)
    client.write(command_to_hexadecimal(power_output_set_safe_threshold(i,10)))
    sleep(0.1)
  end
  client.write(command_to_hexadecimal(power_input_set_monitor_freq(30)))
end

# 9.1
def auth(value)
  value = 43826 if value.nil?
  params = value.to_s(16).rjust(4, '0') + "00000000"
  return command(function = '20', mark = '70', params = params)
end

conn = Bunny.new
conn.start

ch = conn.create_channel
q = ch.queue("tcp.inputs", durable: true)
read_channel = conn.create_channel
x = read_channel.fanout("rails.inputs", durable: true)
read_queue = read_channel.queue("rails.outputs", durable: true)
read_queue.bind(x)

Thread.new do
  loop do
    Thread.start(server.accept) do |client|
      #powers[client] = nil
      File.open('tcp.log',"a+") {|f| f.write("#{Time.now}: auth: #{auth(43826)} \n")}
      client.write(command_to_hexadecimal(auth(43826)))
      sleep(0.1)
      client.write(command_to_hexadecimal(get_machine_mark))
      sleep(0.1)

      #设置电源箱推送
      #init_client_rpc(client)
      init_client_rpc(client) if not is_iot_box
      if is_iot_box
        client.write(command_to_hexadecimal(io_input_set_enable_switch()))
        sleep(0.3)
      end


      Thread.new do
        loop do
          if not client
            break
          end
          rawdata = client.recv(12)
          rawdata+= client.recv(rawdata[9].unpack("C")[0])
          response = rawdata.unpack('H*').first
          next if response.empty?
          File.open('tcp.log',"a+") {|f| f.write("#{Time.now}:sn:#{powers[client]},output: #{response} \n")}
          # response = client.recv(26)
          prefix = response[0..3] # should be ffff
          suffix = response[20..23] # should be ff00
          function = response[4..5]
          mark = response[6..7]
          data = response[8..19]

          # ffff0101610101ffff00ff00
          if function == "01" && mark == "14"
            data_len=rawdata[9].unpack("c")[0]
            #rawdata = rawdata+client.recv(data_len)
            sn = rawdata[10..9+data_len]
            # close the duplicate clients
            powers.each do |p_client, p_sn|
              if sn == p_sn && client != p_client
                powers.delete(p_client)
                p_client.close
              end
            end
            powers[client] = sn
            if is_iot_box #当设备连接上时立即进行一次统一查询
              client.write(command_to_hexadecimal(get_tongyi_chaxun_current_state()))
              sleep(0.3)
            end
          else
          end

          if powers[client]
            q.publish("#{powers[client]},#{response}")
          end
        end
      end
    end
  end
end

loop do
  read_queue.subscribe(:block => true) do |delivery_info, properties, payload|
    File.open('tcp.log',"a+") {|f| f.write("#{Time.now}:input: #{payload} \n")}
    sn, message = payload.split(',')
    next if powers.empty?
    client = nil
    powers.each do |p_client, p_sn|
      if sn == p_sn
        client = p_client
        break
      end
    end
    if not client
      next
    end
    client.write(command_to_hexadecimal(message))
  end
end

rescue Exception => e
  File.open('tcp.log',"a+") {|f| f.write("#{Time.now}:#{e}\n")}
end