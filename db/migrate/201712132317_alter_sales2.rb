class AlterSales2 < ActiveRecord::Migration
	def change
	add index :sales, [:gender, :family name kana, :given_name_kana],
		name: 'index_sales_on_gender_and_furigana'
	end
end

