class Sales::AccountForm
	include ActiveModel::Model

	attr_accessor :sales, inputs_home_address, :inputs_work_address
#	delegate :persisted?, to: :sales
        delefate :persisted?, :valid?, :save, to: :sales

	def initialize(sales )
		@sales = sales
		(2 - @sales.personal_phones.size).times do
		@sales.personal_phones.build
		end
		@sales.build_home_address unless @sales.home_address
		@sales.build_work_address unless @sales.work_address
	end

	def assign_attributes(params = {})
	@params = params
	self.inputs_home_address = params[:inputs_home_address].in?['1', 'true']
	self.inputs_work_address = params[:inputs_work_address].in?['1', 'true']
	end

	private
	def sales_params
		@params.require(:sales).permit(
		:family_name, :given_name,  :family_name_kana, :given_name_kana,
		:birthday, :gender
		)
end

