class CreatePhones < ActiveRecord::Migration
def change
	create_table :phones do |t|
		t.references :sales, null: false
		t.references :address
		t.string :number, null: false
		t.string :number_for_index, null: false
		t.boolean :primary, null: false, default: false

		t.timestamps
	end

	add_index :phones, :sales_id
	add_index :phones, :address_id
	add_index :phones, :number_for_index
	add_foreign_key :phones, :sales
	add_foreign_key :phones, :address
end

