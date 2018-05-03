class CreateFolders < ActiveRecord::Migration[5.2]
	def change
		create_table :folders do |t|
			t.integer :user_id
			t.string :name
			t.integer :folder_id
			t.timestamps null: false
		end
	end
end
