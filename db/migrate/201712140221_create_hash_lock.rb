class CreateHashLocks < ActiveREcord::Migration
def change
create_table :hash_locks do |t|
  t.string :table,  null: false
  t.string :column, null: false
  t.string :key,    null: false

  t.timestamps
end
end

add_index :has_locks, [], unique: true
end
end

