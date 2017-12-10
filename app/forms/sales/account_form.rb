class Sales::AccountForm
	include ActiveModel::Model

	attr_accessor :sales, inputs_home_address, :inputs_work_address
	delegate :persosted?, to: :sales

	def initialize(sales )
		@sales = sales
		(2 - @sales.personal_phones.size).times do
		@sales.personal_phones.build
		end
		@sales.build_home_address unless @sales.home_address
		@sales.build_work_address unless @sales.work_address
	end

	def assign_attributes(params = {})
	end

	private
	def sales_params
		@params.require(:sales).permit(
		:family_name, :given_name,  :family_name_kana, :given_name_kana,
		:birthday, :gender
		)
end

