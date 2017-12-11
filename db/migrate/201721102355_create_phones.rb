class CreatePhones < ActiveRecord::Migration
def change
	create_table :phones do |t|
		#t.references :sales, null: false
		#t.references :address
		#t.string :number, null: false
		#t.string :number_for_index, null: false
		#t.boolean :primary, null: false, default: false
		t.references :sales, null: false
		t.references :cost_member
		t.integer :root_id
		t.integer :parent_id
		t.string  :type,      null: false
		t.string  :status,    null: false, default: 'new'
		t.string  :subject,   null:false
		t.text    :body
		t.text    :remarks
		t.boolean :discarded, null: false, default: false
		t.boolean :deleted,   null: false, default: false

		t.timestamps
	end

	#add_index :phones, :sales_id
	#add_index :phones, :address_id
	#add_index :phones, :number_for_index
	#add_foreign_key :phones, :sales
	#add_foreign_key :phones, :address
	add_index :messages, :sales_id
	add_index :messages, [ :type, :sales_id ]
	add_index :messages, [ :sales_id, :discarded, :created_at ]
	add_index :messages, :cost_member_id
	add_index :messages, [ :sales_id, :deleted, :created_at ]
	add_index :messages, [ :sales_id, :deleted, :status, :created_at ],
		name: 'index_messages_on_c_d_s_c'
	add_index :messages, [ :root_id, :deleted, :created_at ]
	add_foreign_key :messages, :sales
	add_foreign_key :messages, :cost_members
	add_foreign_key :messages, :messages, column: 'root_id'
	add_foreign_key :messages, :messages, column: 'parent_id'
end

end

