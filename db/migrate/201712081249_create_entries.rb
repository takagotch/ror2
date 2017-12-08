class CreateEntries < ActiveRecord::Migration
	def change
		create_table :entries do |t|
			t.references :programs, null:false
			t.references :customer, null:false
			t.boolean    :approved, null:false, default: false
			t.boolean    :canceled, null:false, default: false
			
			t.timestamps
		end

		add_index :entries,[:program_id, :sales_id], unuque: true
		add_index :entries, :sales_id
		add_foreign_key :entries, :programs
		add_foreign_key :entries, :sales
	end
end

