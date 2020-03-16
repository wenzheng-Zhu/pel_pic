# README

This README would normally document whatever steps are necessary to get the
application up and running.!

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

需求：
0 管理 cctv 监控ip 和用户名密码
1 连接DS 硬盘录像机获取视频流:  
2 设置截图频率: N秒间隔
3 设置图片保存时间 M天
4 设置ftp 服务器, 上传打包图片

需求2的实现，每10分钟调用rtsp截屏，代码在lib/tasks/screen_shot.rake
需求3的实现，每8天检查图片是否过期，代码在lib/tasks/check_pic_time.rake
需求4的实现，每周日下午12点对截图进行压缩.zip，上传ftp服务器，代码在lib/tasks/zip_ftp_upload_delete.rake, 上传ftp的脚本是 public/upload_to_ftp.sh


在config/application.yml中设置相关，然后重启项目 