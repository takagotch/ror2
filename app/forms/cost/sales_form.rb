class Cost::SalesForm
	include ActiveModel::Model

	attr_accessor :sales
	delegate :persosted?, to: :sales

	def initialize(sales = nil)
		@sales = sales
		@sales ||= Sales.new(gender: 'male')
		@sales.build_home_address unless @sales.home_address
		@sales.build_work_address unless @sales.work_address
	end
end

