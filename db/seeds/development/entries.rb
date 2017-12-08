programs = Program.where([])
programs.order(id: :desc).limit(3).each_with_index do |p,i|
	Sales.order(:id).limit((i + 1)* 5).each do |c|
		p.applications << c
	end
end

