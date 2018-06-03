# frozen_string_literal: true

require 'securerandom'

class UserContents
  def new_create_user(ns_mail,ns_password,ns_name)#新規ユーザーの登録
    user = User.create(
      u_id:SecureRandom.hex(64),
      name:ns_name,
      mail:ns_mail,
      password_digest:ns_password,
    )

    return user
  end
  def oauth_user(is_mail,is_password)#ユーザーのログイン認証
    begin
      user = User.find_by(mail: is_mail)

      if user.password_digest == is_password
        #sessionの保存をさせる
        return user
      else
        #パスワードが違います
        return false
      end
    rescue
    end
  end
end
