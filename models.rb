require 'bundler/setup'
Bundler.require

if development?
  ActiveRecord::Base.establish_connection("sqlite3:db/development.db")
end

#unless ENV['RACK_ENV'] == 'production'
#    ActiveRecord::Base.establish_connection("sqlite3:db/development.db")
#end

=begin
class User < ActiveRecord::Base
	has_many :user_room
	has_many :room, through: :user_room
	has_many :admin_room
	has_many :folder
end
class Room < ActiveRecord::Base
	has_many :user_room
	has_many :user, through: :user_room
	has_many :admin_room
	has_many :folder_room
	has_many :folder, through: :folder_room
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
	has_many :file
	has_many :folder_room
	has_many :room, through: :folder_room
end
class File< ActiveRecord::Base
	belongs_to :folder
end
class FolderRoom< ActiveRecord::Base
	belongs_to :folder
	belongs_to :room
end
=end
