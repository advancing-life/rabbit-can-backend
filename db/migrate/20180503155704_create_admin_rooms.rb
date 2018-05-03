class CreateAdminRooms < ActiveRecord::Migration[5.2]
	def change
		create_table :admin_rooms do |t|
			t.integer :user_id
			t.integer :room_id
			t.timestamps null: false
		end
	end
end
