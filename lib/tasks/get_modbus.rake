
require 'rmodbus'

task :get_modbus => :environment do 

        rtsp1 = "rtsp://admin:Zpmc1234@192.168.250.60:554/Streaming/Channels/102?transportmode=unicast"
        command1 = "ffmpeg -f rtsp -rtsp_transport tcp -i #{rtsp1} -tune zerolatency -vcodec libx264 -preset ultrafast -acodec libfaac -f flv -an rtmp://192.168.250.77:1935/hls/a1"  
        rtsp2 = "rtsp://admin:Zpmc1234@192.168.250.61:554/Streaming/Channels/102?transportmode=unicast"
        command2 = "ffmpeg -f rtsp -rtsp_transport tcp -i #{rtsp1} -tune zerolatency -vcodec libx264 -preset ultrafast -acodec libfaac -f flv -an rtmp://192.168.250.77:1935/hls/a2" 
        rtsp3 = "rtsp://admin:Zpmc1234@192.168.250.62:554/Streaming/Channels/102?transportmode=unicast"
        command3 = "ffmpeg -f rtsp -rtsp_transport tcp -i #{rtsp1} -tune zerolatency -vcodec libx264 -preset ultrafast -acodec libfaac -f flv -an rtmp://192.168.250.77:1935/hls/a3" 
        rtsp4 = "rtsp://admin:Zpmc1234@192.168.250.63:554/Streaming/Channels/102?transportmode=unicast"
        command4 = "ffmpeg -f rtsp -rtsp_transport tcp -i #{rtsp1} -tune zerolatency -vcodec libx264 -preset ultrafast -acodec libfaac -f flv -an rtmp://192.168.250.77:1935/hls/a4"  
        Thread.start{ system(command1) }
        Thread.start{ system(command2) }
        Thread.start{ system(command3) }
        Thread.start{ system(command4) }
  def platenumber_convert(n)
      hash1 = {"A9BE":"京", "B3C2":"鲁", "BDBC":"冀", "F2BD":"津", "A6BB":"沪", "D5CB":"苏", "E3D5":"浙", "F5B6":"鄂","A5D4":"豫", "EECD":"皖", "E6CF":"湘","D3B8":"赣", "F0B9":"桂", "A8B4":"川", "F3B9":"贵", "C6D4":"云", "E5D3":"渝", "E0C7":"青", "C2C9":"陕", "C1D4":"粤", "EDC7":"琼", "CAB8":"甘", "F6C3":"闽", "FEC4":"宁", "D8B2":"藏", "FABD":"晋", "AABC":"吉", "C2D0":"新", "DABA":"黑", "C9C3":"蒙", "C9C1":"辽", "D5BF":"空", "A3BA":"海", "AFBE":"警", "41":"A", "42":"B", "43":"C", "44":"D", "45":"E", "46":"F", "47":"G", "48":"H", "49":"I", "4A":"J", "4B":"K", "4C":"L", "4D":"M", "4E":"N", "4F":"O", "50":"P", "51":"Q", "52":"R", "53":"S", "54":"T", "55":"U", "56":"V", "57":"W", "58":"X", "59":"Y", "5A":"Z", "30":0, "31":1,"32":2,"33":3, "34":4, "35":5, "36":6, "37":7, "38":8, "39":9 }

      arrr = n.to_s(16).split("")
      sy1 = (arrr[0] + arrr[1]).to_sym
      sy2 = (arrr[2] + arrr[3]).to_sym
      str1 = hash1[sy1]
      str2 = hash1[sy2]
      str2.to_s + str1.to_s
    end
   
   #2.times do
	1800.times do 
   
    hash1 = {"A9BE":"京", "B3C2":"鲁", "BDBC":"冀", "F2BD":"津", "A6BB":"沪", "D5CB":"苏", "E3D5":"浙", "F5B6":"鄂","A5D4":"豫", "EECD":"皖", "E6CF":"湘","D3B8":"赣", "F0B9":"桂", "A8B4":"川", "F3B9":"贵", "C6D4":"云", "E5D3":"渝", "E0C7":"青", "C2C9":"陕", "C1D4":"粤", "EDC7":"琼", "CAB8":"甘", "F6C3":"闽", "FEC4":"宁", "D8B2":"藏", "FABD":"晋", "AABC":"吉", "C2D0":"新", "DABA":"黑", "C9C3":"蒙", "C9C1":"辽", "D5BF":"空", "A3BA":"海", "AFBE":"警", "41":"A", "42":"B", "43":"C", "44":"D", "45":"E", "46":"F", "47":"G", "48":"H", "49":"I", "4A":"J", "4B":"K", "4C":"L", "4D":"M", "4E":"N", "4F":"O", "50":"P", "51":"Q", "52":"R", "53":"S", "54":"T", "55":"U", "56":"V", "57":"W", "58":"X", "59":"Y", "5A":"Z", "30":0, "31":1,"32":2,"33":3, "34":4, "35":5, "36":6, "37":7, "38":8, "39":9 }
    uid = rand(0..255)
    ip = '192.168.250.2'
    
   array = []
	 ModBus::TCPClient.connect(ip, 502) do |cl|  
        cl.with_slave(uid) do |slave|
          a = slave.holding_registers[(99..145)]
          a.each.with_index(1) do |int, index|
            array << [index, int]
          end
      end
  end
# array = [[1, 1],
#              [2, 8],
#              [3, 3],
#              [4, 6],
#              [5, 5],
#              [6, 32],
#              [7, 0],
#              [8, 42683],
#              [9, 12609],
#              [10, 12851],           
#              [11, 13365],
#              [12, 8224],
#              [13, 8224],
#              [14, 9],
#              [15, rand(1..100)],
#              [16, 55994],
#              [17, 13122],
#              [18, 13877],
#              [19, 14136],
#              [20, 8224],
#              [21, 8224],
#              [22, 12],
#              [23, 2],
#              [24, 55994],
#              [25, 13122],
#              [26, 13877],
#              [27, 14136],
#              [28, 8224],
#              [29, 8224],
#              [30, 12],
#              [31, 2],
#              [32, 55994],
#              [33, 13122],
#              [34, 13877],
#              [35, 14136],
#              [36, 8224],
#              [37, 8224],
#              [38, 12],
#              [39, 2],
#              [40, 55994],
#              [41, 13122],
#              [42, 13877],
#              [43, 14136],
#              [44, 8224],
#              [45, 8224],
#              [46, 12],
#              [47, 2]]

       array1 = []
       array.each do |ar|
       	array1 << ar[1]
       end 

       array1
    #第一辆车
       array12 = array1[7..10]
       if array12[0] != 0
        #sy3 = array12[0].to_s(16).to_s.upcase.to_sym
         part_plateno1 = hash1[array12[0].to_s(16).to_s.upcase.to_sym]
         car1 = Car.find_by(id: 1)
         car1.update(platenumber: "#{part_plateno1}#{platenumber_convert(array1[8])}#{platenumber_convert(array1[9])}#{platenumber_convert(array1[10])}", parking_lot_no: array1[13], serial_no: array1[14])
         car1.save
       else
        car1 = Car.find_by(id: 1)
        car1.update(platenumber: "", parking_lot_no: "", serial_no: "")
       end

    #第二辆车
       array13 = array1[15..18]
       if array13[0] != 0
         part_plateno2 = hash1[array1[15].to_s(16).upcase.to_sym]
         car2 = Car.find_by(id: 2)
         car2.update(platenumber: "#{part_plateno2}#{platenumber_convert(array1[16])}#{platenumber_convert(array1[17])}#{platenumber_convert(array1[18])}", parking_lot_no: array1[21], serial_no: array1[22])
         car2.save
       else
        car2 = Car.find_by(id: 2)
        car2.update(platenumber: "", parking_lot_no: "", serial_no: "")
       end

    #第三辆车
       array14 = array1[23..26]
       if array14[0] != 0
         part_plateno3 = hash1[array1[23].to_s(16).upcase.to_sym]
         car3 = Car.find_by(id: 3)
         car3.update(platenumber: "#{part_plateno3}#{platenumber_convert(array1[24])}#{platenumber_convert(array1[25])}#{platenumber_convert(array1[26])}", parking_lot_no: array1[29], serial_no: array1[30])
         car3.save
       else
        car3 = Car.find_by(id: 3)
        car3.update(platenumber: "", parking_lot_no: "", serial_no: "")
       end


    #第四辆车
       array15 = array1[31..34]
       if array15[0] != 0
         part_plateno4 = hash1[array1[31].to_s(16).upcase.to_sym]
         car4 = Car.find_by(id: 4)
         car4.update(platenumber: "#{part_plateno4}#{platenumber_convert(array1[32])}#{platenumber_convert(array1[33])}#{platenumber_convert(array1[34])}", parking_lot_no: array1[37], serial_no: array1[38])
         car4.save
       else
        car4 = Car.find_by(id: 4)
        car4.update(platenumber: "", parking_lot_no: "", serial_no: "")
       end


    #第五辆车
       array16 = array1[39..42]
       if array16[0] != 0
         part_plateno5 = hash1[array1[39].to_s(16).upcase.to_sym]
         car5 = Car.find_by(id: 5)
         car5.update(platenumber: "#{part_plateno5}#{platenumber_convert(array1[40])}#{platenumber_convert(array1[41])}#{platenumber_convert(array1[42])}", parking_lot_no: array1[45], serial_no: array1[46])
         car5.save
       else
        car5 = Car.find_by(id: 5)
        car5.update(platenumber: "", parking_lot_no: "", serial_no: "")
       end



         # 读取suv_amount,car_amount,car_available, suv_available
       p1 = Parkingstate.first
       # str1 = ""
       # array4.each do |n|

       #  str1 << array2[n] + ";"
       # end
       # p1.device_description = str1
       # p1.save

       v2 = array1[1]
       p1&.suv_amount = v2
       p1&.save

       v3 = array1[2]
       p1&.suv_available = v3
       p1&.save

       v4 = array1[3]
       p1&.car_amount = v4
       p1&.save

       v5 = array1[4]
       p1&.car_available = v4
       p1&.save

       v6 = array1[5]
       array5 = v6.to_s(2).reverse.ljust(16, '0').chars
       v7 = array1[6]
       array6 = v7.to_s(2).reverse.ljust(16, '0').chars
       array7 = array5 + array6
       array8 = []
       array7.each_with_index do |value, index|
        array8 << index if value == "1"
       end
       array8
       array9 = ["1号载车版动作中", "2号载车版动作中", "3号载车版动作中", "4号载车版动作中", "5号载车版动作中", "6号载车版动作中", "7号载车版动作中", "8号载车版动作中", "9号载车版动作中", "10号载车版动作中", "11号载车版动作中", "12号载车版动作中", "13号载车版动作中", "14号载车版动作中", "15号载车版动作中", "16号载车版动作中", "17号载车版动作中", "18号载车版动作中", "19号载车版动作中", "20号载车版动作中", "21号载车版动作中", "22号载车版动作中"]
       # str2 = ""

       if !array8.size == 0
         array8.each do |n|
         str2 << "#{array9[n]}" + ";" 
          end
         else
          str2 = ""
        end
       p1&.carboard_description = str2
       p1&.save


       array2 = ["设备运行中", "设备停止中", "设备故障中", "车库满", "取车运行中", "存车运行中", "存车完成指令", "取车完成指令"]

       v1 = array1[0]
       array3 = v1.to_s(2).reverse.ljust(16, '0').chars
       array4 = []
       array3.each_with_index do |value, index|
       	if value == "1"
       		array4 << index 
       	end
       end
       array4

  
        if array4.include?1
          Screen.first.update(state: "3")
          # Jiemuzuhe2.first.update(video: "http://192.168.250.202:3000/xuanchuanpian.mp4")
          Jiemuzuhe2.first.update(video: "http://192.168.250.77:3000/xuanchuanpian.mp4")
        end

       # if array4.include?0 && (!(array4.include?3))
       #   Screen.first.update(state: "4")
       #   Word.second.update(item_id: 3, content: "欢迎使用垂直升降立体车库，请驶入停车台。", duration: "2")
       #   # Car.last.update(platenumber: "沪A873S2")
       # end

       # if array4.include?0 && (array4.include?3)
       #  Screen.first.update(state: "4")
       #  Word.second.update(item_id: 3, content: "车库车辆已满，请驶向其他车库。", duration: "2")
       # end

       # if array4.include?5
       #  Screen.first.update(state: "1")
       #  rtsp1 = "rtsp://admin:zpmc1003@192.168.250.68:554/Stream/Channels/101?transportmode=unicast"
       #  command1 = "ffmpeg -f rtsp -rtsp_transport tcp -i #{rtsp1} -t 00::15:00 -f flv -an rtmp://127.0.0.1:1935/hls/test1" 
       #  rtsp2 = "rtsp://admin:zpmc1003@192.168.250.68:554/Stream/Channels/201?transportmode=unicast"
       #  command2 = "ffmpeg -f rtsp -rtsp_transport tcp -i #{rtsp1} -t 00::15:00 -f flv -an rtmp://127.0.0.1:1935/hls/test2"
        

       #  rtsp1 = "rtsp://admin:zpmc1003@192.168.250.68:554/h264/ch1/main/av_stream"
       #  rtsp1 = "rtsp://admin:zpmc1003@192.168.250.68:554/Streaming/Channels/101?transportmode=multicast"

       #   command1 = "ffmpeg -f rtsp -rtsp_transport tcp -i #{rtsp1} -f flv -an rtmp://192.168.250.202:1935/hls/test1"  
       #  rtsp2 = "rtsp://admin:zpmc1003@192.168.250.61:554/h264/ch2/main/av_stream"
       #  command2 = "ffmpeg -f rtsp -rtsp_transport tcp -i #{rtsp2} -t 00:15:00 -f flv -r 25 -s 640*360 -an rtmp://192.168.250.202:1935/hls/test1" 


       #  Thread.start{ system(command1) }
       #  # Thread.start{ system(command2) }
       #  # Word.second.update(item_id: 3, content: "正在存车中。", duration: "2")
       #  Jiemuzuhe1.first.update(video1: "rtmp://192.168.250.202:1935/hls/test1", video2: "rtmp://192.168.250.202:1935/hls/test1", desc: "正在存车", command_type: "1")

       # end

       # if array4.include?6
       #  Screen.first.update(state: "4")
       #  Word.second.update(item_id: 3, content: "存车完成", duration: "2")
       # end

       if array4.include?4
        Screen.first.update(state: "1")
        # array_temp = []
        # Car.all.each do |car|
        #   array_temp << car.platenumber
        # end
        # array_temp2 = array_temp.uniq
        # array_temp2.delete("")
        # y = array_temp2.size
        # Screen.first.update(state: "1") if y == 1   #1 car
        # Screen.first.update(state: "2") if y == 2   #2 cars
        # Screen.first.update(state: "5") if y == 3   #3 cars
        # Screen.first.update(state: "6") if y == 4   #4 cars
        # Screen.first.update(state: "7") if y == 5   #5 cars

        #  array_temp = []
        #  array_temp2 = []



        # rtsp1 = "rtsp://admin:zpmc1003@192.168.250.68:554/Stream/Channels/101?transportmode=unicast"
        # command1 = "ffmpeg -f rtsp -rtsp_transport tcp -i #{rtsp1} -t 00::15:00 -f flv -an rtmp://127.0.0.1:1935/hls/test1" 
        # rtsp2 = "rtsp://admin:zpmc1003@192.168.250.68:554/Stream/Channels/201?transportmode=unicast"
        # command2 = "ffmpeg -f rtsp -rtsp_transport tcp -i #{rtsp1} -t 00::15:00 -f flv -an rtmp://127.0.0.1:1935/hls/test2"
        


        # rtsp1 = "rtsp://admin:zpmc1003@192.168.250.68:554/h264/ch1/main/av_stream"
        #rtsp1 = "rtsp://admin:zpmc1003@192.168.250.68:554/Streaming/Channels/101?transportmode=multicast"

        # command1 = "ffmpeg -f rtsp -rtsp_transport tcp -i #{rtsp1} -f flv -an rtmp://192.168.250.202:1935/hls/test1"  
        # rtsp2 = "rtsp://admin:zpmc1003@192.168.250.61:554/h264/ch2/main/av_stream"
        # command2 = "ffmpeg -f rtsp -rtsp_transport tcp -i #{rtsp2} -t 00:15:00 -f flv -r 25 -s 640*360 -an rtmp://192.168.250.202:1935/hls/test2" 

      #Thread.start{ system(command1) }
       # Thread.start{ system(command2) }
        Word.second.update(item_id: 3, content: "#{Car.last.platenumber}正在取车中")
        Jiemuzuhe1.first&.update(video1: "rtmp://192.168.250.77:1935/hls/a1", video2: "rtmp://192.168.250.77:1935/hls/a4", desc: "#{Car.first.platenumber}正在取车中", command_type: "1" )
       end

       # if array4.include?7
       #  Screen.first&.update(state: "4")
       #  # Word.second.update(item_id: 3, content: "取车完成，请#{Car.last.platenumber}车车主驶离")
       #  #Jiemuzuhe1.first.update(video1: "", video2: "", desc: "取车完成，请#{Car.first.platenumber}车车主驶离", command_type: "1" )
       #  Word.second&.update(item_id: 3, content: "取车完成，请#{Car.first.platenumber}车车主驶离", duration: "2")
       # end

     
       
    # 创建一个screen的对象,screen的state值一共有两个值 "1"和"2", "1"的状态是指屏幕放三块屏幕的，"2"的状态是指 不放三块屏幕，screen的state值默认为"2"，

    #     s1 = Screen.new
    #       s1.state = "2"
    #     array10 = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22"]
    #     array11 = []
    #     array10.each do |ar|
    #      if p1.carboard_description.include?(ar)
    #       array11 << 1
    #      end
    #     end
    #    if array11.include?1
    #     s1.state == "1"
    #     s1.save
    #    end
    #    s1.save

    
   sleep 2
     


  end

end



  

    


