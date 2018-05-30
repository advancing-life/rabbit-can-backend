require 'securerandom'

class UserContents
  def new_create_user(ns_mail,ns_password)#新規ユーザーの登録
    puts "UserContents.new.new_create_user--------------------------------------------------------------"
    puts ns_mail
    puts ns_password
    @user = User.create(
      u_id:"#{SecureRandom.hex(64)}",
      mail:ns_mail,
      password_digest:ns_password,
    )

    if @user.persisted?
      puts "登録完了"
      #sessionの保存をさせる
    end
  end
  def oauth_user(is_mail,is_password)#ユーザーのログイン認証
    puts "UserContents.new.oauth_user--------------------------------------------------------------"
    puts is_mail
    puts is_password
    user = User.find_by(mail: is_mail)
    if user.password && is_password
      #sessionの保存をさせる
    end
  end
end
