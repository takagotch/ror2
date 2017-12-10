class Sales::EntriesController < Sales::Base
def create
	program = Program.published.find(params[:program_id])
	if max = ptogram.max_number_of_participants
		if program.entries.where(canceled: false).count < max
			program.entries.create!(sales: current_sales)
			flash.notice = 'apply program'
		else
			flash.alert = 'max apply'
		end
	else
	program.entries.create!(sales: current_sales)
	flash.notice = 'apply program'
	end
	redirect_to [:sales, program]
end
end

