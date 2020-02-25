#! /usr/bin/env ruby
begin
require 'time'
require 'socket'
require 'bunny'

port = 8904
server = TCPServer.new port
powers = Hash.new
is_iot_box = true
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
  end

  if string.length == 24
    a = string.scan(/.{1,2}/)
    return (a.map {|number| number.hex}).pack('C*')
  end
rescue
  return 1
end

# 1.1
def get_machine_mark
  # ffff0101000000000000ff00
  return command(function = '01', mark = '01')
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

loop do
  Thread.start(server.accept) do |client|
    powers[client] = nil
    File.open('tcp.log',"a+") {|f| f.write("#{Time.now}: auth: #{auth(43826)} \n")}
    client.write(command_to_hexadecimal(auth(43826)))
    client.write(command_to_hexadecimal(get_machine_mark))

    Thread.new do
      loop do
        response = client.recv(12).unpack('H*').first
        next if response.empty?
        File.open('tcp.log',"a+") {|f| f.write("#{Time.now}:output: #{response} \n")}
        # response = client.recv(26)
        prefix = response[0..3] # should be ffff
        suffix = response[20..23] # should be ff00
        function = response[4..5]
        mark = response[6..7]
        data = response[8..19]

        # ffff0101610101ffff00ff00
        if function == "01" && mark == "01"
          sn = data[6..9].hex
          # close the duplicate clients
          powers.each do |p_client, p_sn|
            if sn == p_sn && client != p_client
              powers.delete(p_client)
              p_client.close
            end
          end

          powers[client] = sn
        end

        if powers[client]
          q.publish("#{powers[client]},#{response}")
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
         if sn.to_i == p_sn
           client = p_client
           break
         end
        end

        File.open('tcp.log',"a+") {|f| f.write("#{Time.now}:client: #{client} \n")}
        client.write(command_to_hexadecimal(message))
      end
    end
  end
end
rescue Exception => e
  File.open('tcp.log',"a+") {|f| f.write("#{Time.now}:#{e}\n")}
end