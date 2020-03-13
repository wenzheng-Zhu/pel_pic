task :after_reboot => :environment do



	@ftp_record = Ftprecord.last
	@ftp_record ||= Ftprecord.create(ftp_address: "ftp_address", ftp_username: "ftp_username", ftp_password: "ftp_password", upload_pic_ftp_address: "upload_pic_ftp_address", local_zip_address: "local_zip_address")

	rp1 = @ftp_record.ftp_address
	rp11= ENV['ftp_address']

	rp2 = @ftp_record.ftp_username
	rp22 = ENV['ftp_user_name']

	rp3 = @ftp_record.ftp_password
	rp33 = ENV['ftp_password']

	rp4 = @ftp_record.upload_pic_ftp_address
	rp44 = ENV['upload_pic_ftp_address']

	rp5 = @ftp_record.local_zip_address
	rp55 = "#{ENV['project_path']}/public"

    File.open("#{ENV['project_path']}/public/upload_to_ftp.sh") do |lines|
    	b1 = lines.read.gsub(rp1, rp11)
    	File.open("#{ENV['project_path']}/public/upload_to_ftp.sh", "w") { |l| l.write(b1) }
    end

    File.open("#{ENV['project_path']}/public/upload_to_ftp.sh") do |lines|
    	b2 = lines.read.gsub(rp2, rp22)
    	File.open("#{ENV['project_path']}/public/upload_to_ftp.sh", "w") { |l| l.write(b2) }
    end

    File.open("#{ENV['project_path']}/public/upload_to_ftp.sh") do |lines|
    	b3 = lines.read.gsub(rp3, rp33)
    	File.open("#{ENV['project_path']}/public/upload_to_ftp.sh", "w") { |l| l.write(b3) }
    end

     File.open("#{ENV['project_path']}/public/upload_to_ftp.sh") do |lines|
    	b4 = lines.read.gsub(rp4, rp44)
    	File.open("#{ENV['project_path']}/public/upload_to_ftp.sh", "w") { |l| l.write(b4) }
    end

     File.open("#{ENV['project_path']}/public/upload_to_ftp.sh") do |lines|
    	b5 = lines.read.gsub(rp5, rp55)
    	File.open("#{ENV['project_path']}/public/upload_to_ftp.sh", "w") { |l| l.write(b5) }
    end



    @ftp_record.update(ftp_address: rp11, ftp_username: rp22, ftp_password: rp33, upload_pic_ftp_address: rp44, local_zip_address: rp55)


    #创建每个pelco摄像头所存储截屏的文件
    Pelco.all.each do |pel|
        command = "cd #{ENV['pic_store_path']} && mkdir #{pel.name}_screen_shot"
        system(command)
    end




end