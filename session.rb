class Session_oauth
  def user(into_mail, into_u_id)
    begin
      user = User.find_by(mail: into_mail)

      if user.u_id == into_u_id
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
