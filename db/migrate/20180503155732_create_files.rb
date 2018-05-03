class CreateFiles < ActiveRecord::Migration[5.2]
  def change
		create_table :files do |t|
			t.integer :folder_id
			t.string :name
			t.string :body
			t.timestamps null: false
		end
  end
end
