class Cost::ProgramsController < Cost::Base
	def index
		#scope, app/models/program.rb
		#@programs = Program.order(application_start_time: :desc)
		#	includes(:registrant).page(params[:page])
		@programs = Program.listing.page(params[:page])
	end

	def show
		#@program = Program.find(params[:id])
		@program = Program.listing.find(params[:id])
	end

	def new
		@program_for = Cost::ProgramForm.new
	end

	def edit
		@program_form = Cost::ProgramFrom.new(Program.find(params[:id]))
	end
end

