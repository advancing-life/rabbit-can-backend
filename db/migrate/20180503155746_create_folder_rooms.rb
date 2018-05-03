class CreateFolderRooms < ActiveRecord::Migration[5.2]
  def change
		create_table :folder_rooms do |t|
			t.integer :folder_id
			t.integer :room_id
			t.timestamps null: false
		end
  end
end
