
 ####本地的/Users/rippletech/workspace/pel_pic/public/screen_shot.zip  to ftp服务器上的/awsm/####

#!/bin/sh
export today=`date +%Y%m%d`
 
ftp -v -n 10.40.242.200 <<EOF               #ftp服务器的ip地址,登入ftp服务器的用户名和密码
user username password                      
binary
hash
cd /awsm/###
lcd /Users/rippletech/workspace/pel_pic/public/pic_zip/
prompt
mput *
bye
#here document
EOF
echo "commit to ftp successfully"
