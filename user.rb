# frozen_string_literal: true

require 'securerandom'

class UserContents
  def create_user(mail, password) # 新規ユーザーの登録
    user = User.create(
      u_id: SecureRandom.hex(64),
      mail: mail,
      password_digest: password
    )
    # (user.save ? user : nil)
    return user
  end

  def oauth_user(is_mail, is_password) # ユーザーのログイン認証
    puts 'UserContents.new.oauth_user--------------------------------------------------------------'
    puts is_mail
    puts is_password
    user = User.find_by(mail: is_mail)
    if user.password && is_password
      # sessionの保存をさせる
    end
  end
end
