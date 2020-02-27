namespace :mail do
	desc "確認メールを送るstart"
	task dont_forget: :production do
		NotificationMailer.dont_forget
		puts "hello"
	end

	desc "確認メールを送るend"
	task dont_forget_end: :production do
		NotificationMailer.dont_forget_end
		puts "Hello"
	end

	desc "ユーザー全員にメールを送る"
	task send_invate_to_user: :production  do
		NotificationMailer.send_invate_to_user
		puts "world"
	end
end