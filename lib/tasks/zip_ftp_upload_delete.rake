task :zip_ftp_upload_delete => :environment do


    command1 = "cd && zip -r /Users/rippletech/workspace/pel_pic/public/pic_zip/pic_#{Time.now}.zip /Users/rippletech/workspace/pel_pic/public/screen_shot"
	command2 = "cd /Users/rippletech/workspace/pel_pic/public && upload_to_ftp.sh"
	command3 = "cd /Users/rippletech/workspace/pel_pic/public/pic_zip && rm -rf *.zip"


    
    system(command1)

    sleep 600  #压缩等10分钟

	system(command2)


	sleep  1800    #30分钟后


	system(command3)
	
	
end