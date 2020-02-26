mail = ENV['MAIL_ADDRESS']
pass = ENV['MAIL_PASSWORD']

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address: 'smtp.gmail.com',
  domain: 'gmail.com',
  port: 587,
  user_name: mail,
  password: pass,
  authentication: 'plain',
  enable_starttls_auto: true
}