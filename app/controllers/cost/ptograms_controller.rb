class Cost::ProgramsController < Cost::Base
	def index
		@programs = Program.order(application_start_time: :desc)
			.page(params[:page])
	end
end

