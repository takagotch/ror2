class Sales::EntryAcceptor
	def initialize(sales)
		@sales = sales
	end

	def accept(program)
	  ActiveRecord::Base.transaction do
	    program.lock!
		if max = ptogram.max_number_of_participants
			if program.entries.where(canceled: false).count < max
				program.entries.create!(sales: @sales)
				return :accepted
			else
				return :full
			end
		else
			program.entries.create!(sales: @sales)
			return :accepted
		end
	  end
	end
end

