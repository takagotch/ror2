class CreateTag < ActiveRecord::Migration
	def change
	create_talble :tags do |t|
		t.string :value, null: false
	end

	add_index :tags, :value, unique: true
end

