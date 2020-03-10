class CreateFtprecords < ActiveRecord::Migration[5.2]
  def change
    create_table :ftprecords do |t|
      t.string :ftp_address
      t.string :ftp_username
      t.string :ftp_password
      t.string :upload_pic_ftp_address
      t.string :local_zip_address

      t.timestamps
    end
  end
end
