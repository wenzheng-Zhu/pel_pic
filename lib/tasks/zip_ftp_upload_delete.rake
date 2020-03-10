task :zip_ftp_upload_delete => :environment do


    command1 = "cd && zip -r #{ENV['pic_store_path']}/pic_#{Time.now}.zip  #{ENV['pic_store_path']}"
	command2 = "cd #{ENV['project_path']}/public && upload_to_ftp.sh"
	command3 = "cd  #{ENV['pic_store_path']} && rm -rf *.zip"


    
    system(command1)

    sleep 600  #压缩等10分钟

	system(command2)


	sleep  1800    #30分钟后


	system(command3)
	
	
end