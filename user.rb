require 'securerandom'

class UserContents
	def new_create_user#新規ユーザーの登録
		@user = User.create(
			u_id:"#{SecureRandom.hex(32)}",
			mail:params[:mail],
			password:params[:password],
			password_confirmation:params[:password_confirmation]
		)

		if @user.persisted?
			#sessionの保存をさせる
		end
	end
	def oauth_user(s_mail,s_password)#ユーザーのログイン認証
		user = User.find_by(mail: s_mail)
		if user && user.authenticate(s_password)
			#sessionの保存をさせる
		end
	end
end
