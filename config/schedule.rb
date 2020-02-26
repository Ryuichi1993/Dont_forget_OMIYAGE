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
env :PATH, ENV['PATH'] # 絶対パスから相対パス指定
rails_env = ENV['RAILS_ENV'] || :development
# cronを実行する環境変数をセット
set :environment, :development, :production
set :output, 'log/cron.log' # ログの出力先ファイルを設定
every 1.hours do
	rake "mail:dont_forget"
	runner "NotificationMailer.dont_forget.deliver"
end

every 1.hours do
	rake "mail:dont_forget_end"
	runner "NotificationMailer.dont_forget_end.deliver"
end

every 4.days do
	rake "mail:send_invate_to_user"
	runner "NotificationMailer.send_invate_to_user(@end_user).deliver"
end

