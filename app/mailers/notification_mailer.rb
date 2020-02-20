class NotificationMailer < ApplicationMailer
	default from: "huzimokunn0@gmail.com"

  def send_confirm_to_end_user(end_user)
    @end_user = end_user
    mail(
      subject: "会員登録が完了しました。", #メールのタイトル
      to: @end_user.email #宛先
    ) do |format|
      format.text
    end
  end

  def dont_forget
    Reservation.find_each do |r|
      time = ((r.start_date - Time.now) / 3600) - 9
      if time > 0 && time <= 1
          mail(
            subject: "お土産を買い忘れないように",
            to: r.end_user.email
          ) do |format|
            format.text
            end
      end
    end
  end

  def dont_forget_end
    Reservation.find_each do |r|
      time = ((r.end_date - Time.now) / 3600) - 9
      if time > 0 && time <= 1
          mail(
            subject: "お土産を買い忘れないように",
            to: r.end_user.email
          ) do |format|
            format.text
            end
      end
    end
  end

  def send_invate_to_user(end_user)
    @end_user = EndUser.all
    @end_user.each do |u|
    mail(
      subject: "旅行に行かれる時は",
      to: u.email
    ) do |format|
      format.text
      end
    end
  end
end

