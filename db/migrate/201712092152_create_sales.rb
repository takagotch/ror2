class CreateCost < ActiveRecord::Migration
	def change
        create_table :costs do |t|
		t.string :email, null: false
		t.string :email_for_index, null: false
		t.string :family_name, null: false
		t.string :given_name, null: false
		t.string :family_name_kana, null: false
		t.string :given_name_kana, null: false
		t.string :gender
		t.date   :birthday
		t.string :hashed_password

		t.timestamps
	end

	add_index :costs, :email_for_index, unique: true
	add_index :costs, [ :family_name_kana, :given_name_kana ]
	end
end

