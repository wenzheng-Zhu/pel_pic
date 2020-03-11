task :screen_shot => :environment do


     Pelco.all.each do |pel|
	    t = Time.now.to_s.delete("-").delete(" ").delete(":").split("+")[0]
		command = "ffmpeg -y -i rtsp://#{pel.ip}/stream1 -ss 00:00:01 -vframes 1 -f image2 -vcodec png #{ENV['pic_store_path']}/image_#{pel.camera_name}_#{t}.png"         #pelco获取rtsp流，rtsp://IP地址/stream1

		system(command)
	end
	
	
end