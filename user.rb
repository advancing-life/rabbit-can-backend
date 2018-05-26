require 'securerandom'

class UserContents
<<<<<<< HEAD
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
=======
  def new_create_user(ns_mail,ns_password)#新規ユーザーの登録
    @user = User.create(
      u_id:"#{SecureRandom.hex(32)}",
      mail:ns_mail,
      password:ns_password,
    )

    if @user.persisted?
      #sessionの保存をさせる
    end
  end
  def oauth_user(is_mail,is_password)#ユーザーのログイン認証
    user = User.find_by(mail: is_mail)
    if user && user.password(is_password)
      #sessionの保存をさせる
    end
  end
>>>>>>> ce93132417e92398be9e8abf83854ff2a923c1e5
end
