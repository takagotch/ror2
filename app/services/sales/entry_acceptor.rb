class Sales::EntryAcceptor
	def initialize(sales)
		@sales = sales
	end

	def accept(program)
	  raise if Time.current < program.application_start_time
	  return :closed if Time.current >= program.application_end_time
	    ActiveRecord::Base.transaction do
	      program.lock!
	      if program.entries.where(sales_id: @sales_id: @sales.id).exists?
	        return :accepted
	      elsif max = program.max_number_of_participants
	      #if max = program.max_number_of_participants
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

