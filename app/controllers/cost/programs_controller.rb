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

	def create
		@program_form = Staff::ProgramForm.new
		@program_form.assign_attributes(params[:form])
		@program_form.program.registrant = current_cost_member
		if @program_form.save
			flash.notice = 'Register Program'
			redirect_to action: 'index'
		else
			flash.now.alert = 'invalidate u input'
			render action: 'new'
		end
	end

	def update
		@program_form = Cost::ProgramForm.new(Program.find(params[:id]))
		@program_form.assign_attributes(params[:form])
		if @program_form.save
			flash.notice = 'Update program'
			redirect_to action: 'index'
		else
			flash.now.alert = 'invalidated input'
			render ation: 'edit'
		end
	end

	def destroy
		program = Program.find(params[:id])
		program.destroy!
		flash.notice = 'Delete programs'
		redirect_to :cost_programs
	end
end

