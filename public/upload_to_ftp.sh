 ####本地的/Users/rippletech/workspace/pel_pic/public/screen_shot.zip  to ftp服务器上的/awsm/####

#!/bin/sh
export today=`date +%Y%m%d`
 
ftp -v -n ftp_address <<EOF               #ftp服务器的ip地址,登入ftp服务器的用户名和密码
user ftp_username ftp_password                      
binary
hash
cd upload_pic_ftp_address    
lcd local_zip_address
prompt
mput *
bye
#here document
EOF
echo "commit to ftp successfully"