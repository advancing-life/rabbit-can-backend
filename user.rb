require 'securerandom'

class UserContents
	def new_create_user(ns_mail,ns_password)#新規ユーザーの登録
    puts "UserContents.new.new_create_user"
=begin
		@user = User.create(
			u_id:"#{SecureRandom.hex(32)}",
			mail:ns_mail,
			password:ns_password,
		)

		if @user.persisted?
			#sessionの保存をさせる
		end
=end
	end
	def oauth_user(is_mail,is_password)#ユーザーのログイン認証
		user = User.find_by(mail: is_mail)
		if user.password && is_password
			#sessionの保存をさせる
		end
	end
end
