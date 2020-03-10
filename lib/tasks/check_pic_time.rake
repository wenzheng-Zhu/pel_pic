task :check_pic_time => :environment do


	require 'find'
    require 'pathname'
    require 'fileutils'

    DIR_PHOTOS = ENV['pic_store_path']

    arr = []   #记录所有图片文件的文件名
    arr2 = []  #记录过期的图片的文件名

    Find.find(DIR_PHOTOS) do |filename|

    	path = Pathname.new(filename)
    	extname = path.extname              #文件名的后缀，比如.png, .jpg等
    	full_name = path.basename           #文件名 image_20200220172408.png

    	if extname == ".png"
    		arr << full_name                
    	end

    end


    arr.each do |ar|

    	if (Time.mktime(ar[-18..-15], ar[-14..-13], ar[-12..-11], ar[-10..-9], ar[-8..-7], ar[-6..-5]) - Time.now) > ENV['pic_outdate_time'].to_i*24*60*60    # 如果该图片的创建时间大于几天就被删除
    		arr2 << ar
    	end

    end


    arr2 

    arr2.each do |ar2|
    
    	system("cd #{DIR_PHOTOS} && rm -rf #{ar2}")

    end
	
	
end



