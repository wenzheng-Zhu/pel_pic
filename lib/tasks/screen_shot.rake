task :screen_shot => :environment do


    
    t = Time.now.to_s.delete("-").delete(" ").delete(":").split("+")[0]
	command = "ffmpeg -y -i http://localhost:3000/keep.mp4 -ss 00:00:01 -vframes 1 -f image2 -vcodec png /Users/rippletech/workspace/pel_pic/public/screen_shot/image_#{t}.png"         #pelco获取rtsp流，rtsp://IP地址/stream1

	system(command)
	
	
end