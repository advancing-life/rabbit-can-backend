require 'bundler/setup'
Bundler.require
require 'bcrypt'

if development?
  ActiveRecord::Base.establish_connection("sqlite3:db/development.db")
end

#unless ENV['RACK_ENV'] == 'production'
#    ActiveRecord::Base.establish_connection("sqlite3:db/development.db")
#end

class User < ActiveRecord::Base
end
=begin
	has_many :user_rooms
	has_many :rooms, through: :user_rooms
	has_many :admin_rooms
	has_many :rooms, through: :admin_rooms
	has_many :folders
end

  has_secure_password
  # has_many :user_rooms
  # has_many :rooms, through: :user_rooms
  # has_many :admin_rooms
  # has_many :rooms, through: :admin_rooms
  # has_many :folders
end

class Room < ActiveRecord::Base
  has_many :user_rooms
  has_many :users, through: :user_rooms
  has_many :admin_rooms
  has_many :users, through: :admin_rooms
  has_many :folder_rooms
  has_many :folders, through: :folder_rooms
end

class UserRoom < ActiveRecord::Base
  belongs_to :user
  belongs_to :room
end

class AdminRoom < ActiveRecord::Base
  belongs_to :user
  belongs_to :room
end

class Folder < ActiveRecord::Base
  belongs_to :user
  has_many :files
  has_many :folder_rooms
  has_many :rooms, through: :folder_rooms
end

class File < ActiveRecord::Base
	belongs_to :folder
end

class FolderRoom < ActiveRecord::Base
	belongs_to :folder
	belongs_to :room
class File< ActiveRecord::Base
  belongs_to :folder
end

class FolderRoom< ActiveRecord::Base
  belongs_to :folder
  belongs_to :room
end
=end
