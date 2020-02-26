task :check_pic_time => :environment do


	require 'find'
    require 'pathname'
    require 'fileutils'

    DIR_PHOTOS = "/Users/rippletech/workspace/pel_pic/public/screen_shot"

    arr = []   #记录所有图片文件的文件名
    arr2 = []  #记录过期的图片的文件名

    Find.find(DIR_PHOTOS) do |filename|

    	path = Pathname.new(filename)
    	extname = path.extname              #文件名的后缀，比如.png, .jpg等
    	full_name = path.basename           #文件名 比如hell.jpg

    	if extname == ".png"
    		arr << full_name                
    	end

    end


    arr.each do |ar|

    	if (Time.mktime(ar[6..9], ar[10..11], ar[12..13], ar[14..15], ar[16..17], ar[18..19]) - Time.now) > 7*24*60*60    # 如果该图片的创建时间大于7天
    		arr2 << ar
    	end

    end


    arr2 

    arr2.each do |ar2|
    
    	system("cd /Users/rippletech/workspace/pel_pic/public/screen_shot && rm -rf #{ar2}")

    end
	
	
end



