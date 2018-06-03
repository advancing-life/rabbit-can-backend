# frozen_string_literal: true

require 'bundler/setup'
Bundler.require
require 'securerandom'

require 'sinatra'
require 'sinatra/activerecord'

before do
  config = YAML.load_file('./database.yml')["database"]
  ActiveRecord::Base.configurations = config
  ActiveRecord::Base.establish_connection(config['development'])
end

after do
  ActiveRecord::Base.connection.close
end

class User < ActiveRecord::Base
  validates :u_id, uniqueness: true
  validates :mail, presence: true,
    uniqueness: true, 
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
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
    user = User.find_by(mail: is_mail)

    if user && user.password_digest == is_password
      #sessionの保存をさせる
      return user
    end
  end

end
#   has_many :user_rooms
#   has_many :rooms, through: :user_rooms
#   has_many :admin_rooms
#   has_many :rooms, through: :admin_rooms
#   has_many :folders
# end
#
#   has_secure_password
#   # has_many :user_rooms
#   # has_many :rooms, through: :user_rooms
#   # has_many :admin_rooms
#   # has_many :rooms, through: :admin_rooms
#   # has_many :folders
# end
#
# class Room < ActiveRecord::Base
#   has_many :user_rooms
#   has_many :users, through: :user_rooms
#   has_many :admin_rooms
#   has_many :users, through: :admin_rooms
#   has_many :folder_rooms
#   has_many :folders, through: :folder_rooms
# end
#
# class UserRoom < ActiveRecord::Base
#   belongs_to :user
#   belongs_to :room
# end
#
# class AdminRoom < ActiveRecord::Base
#   belongs_to :user
#   belongs_to :room
# end
#
# class Folder < ActiveRecord::Base
#   belongs_to :user
#   has_many :files
#   has_many :folder_rooms
#   has_many :rooms, through: :folder_rooms
# end
#
# class File < ActiveRecord::Base
#   belongs_to :folder
# end
#
# class FolderRoom < ActiveRecord::Base
#   belongs_to :folder
#   belongs_to :room
# class File< ActiveRecord::Base
#   belongs_to :folder
# end
#
# class FolderRoom< ActiveRecord::Base
#   belongs_to :folder
#   belongs_to :room
# end
