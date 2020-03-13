task :screen_shot => :environment do

	require 'thread'

	mutex = Mutex.new

    Pelco.all.each do |pel|
     	thr = Thread.new do
     		mutex.synchronize do
	     		t = Time.now.to_s.delete("-").delete(" ").delete(":").split("+")[0]
			    command = "ffmpeg -y -i rtsp://#{pel.ip}/stream1 -ss 00:00:01 -vframes 1 -f image2 -vcodec png #{ENV['pic_store_path']}/#{pel.name}_screen_shot/image_#{pel.camera_name}_#{t}.png"         #pelco获取rtsp流，rtsp://IP地址/stream1
			    system(command)
			    sleep 1
     		end
     	end
     	thr.join    
	end
	
	
end