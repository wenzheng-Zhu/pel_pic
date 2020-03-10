# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever


#env :PATH, ENV['PATH']
#set :output, 'log/cron.log'
set :environment, :development
#every 1.hour  do
# every 30.minutes do 
# 	rake 'get_modbus'

# end

every :reboot do
  rake 'after_reboot'
end


every ENV['screen_shot_time'].to_i.minutes do
	rake 'screen_shot'
end


every ENV['check_pic_time'].to_i.days do
	rake 'check_pic_time'
end


every ENV['zip_ftp_upload_delete_date'].to_sym, at: '12pm' do           # Use any day of the week or :weekend, :weekday
    rake  'zip_ftp_upload_delete'
end