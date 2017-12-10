class AlterSales1 < ActiveRecord::Migration
def change
	add_column :sales, birth_year, :integer
	add_column :sales, birth_month, :integer
	add_column :sales, birth_mday, :integer

	add_index :sales, [ :birth_year, :birth_month, :birth_mday ]
	add_index :sales, [ :birth_month, :birth_mday ]
	add_index :sales, :given_name_kana
	add_index :sales, [ :birth_year, :family_name_kana, :given_name_kana ],
	  name: 'index_sales_on_birth_year_and_furigana'
	add_index :sales, [ :bitrh_year, :given_name_kana ]
	add_index :sales,
	  [ :birth_month, :family_name_kana, :given_name_kana ]
	add_index :sales, [ :birth_month, :given_name_kana ]
	add_index :sales, [ :birth_mday, :family_name_kana, :given_name_kana ].
	  name: 'index_sales_on_birth_mday_and_furigana'
	add_index :sales, [ :birth_mday, :given_name_kana ]
end

end

