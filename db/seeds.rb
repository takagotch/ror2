common_table_names = %w(hash_locks)
common_table_names.each do |table_name|
	path = Rails.root.join('db', 'seeds', "#{table_name.rb}")
	if File.exist?(path)
		puts "Createing #{table_name...}"
		require(path)
	end
end


table_names = %w(cost_members profits cost_events sales administrators)
programs entries messages)
table_names.each do |table_name|

