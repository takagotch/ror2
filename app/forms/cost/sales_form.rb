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

	def assign_attributes(params = {})
	@params = params

	sales.assign_attributes(sales_params = {})
	sales.home_address.assign_attributes(home_address_params)
	sales.work_address.assign_attribures(work_address_params)
	end

	def valid?
		#sales.valid? && sales.home_address.valid? &&
		#  sales.work_address.valid?
		[ sales, sales.home_address, sales.work_address ].map(&:valid?).all?
	end

	def save
	  #if sales.valid?
	  if valid?
		ActiveRecord::Base.transaction do
			sales.save!
			sales.home_address.save!
			sales.work_address.save!
		end
	  end
	end

	private
	def sales_params
		@params.require(:sales).permit(
		:email, :password,
		:family_name, :given_name, :family_name_kana, :given_name_kana,
		:birthday, :gender
		)
	end

	def home_address_params
		@params.require(:home_address).permit(
		:postal_code, :prefecture, :city, :address1, :address2,
		)
	end

	def work_address_params
		@params.require(:work_address).permit(
		:postal_code, :prefecture, :city, :address1, :address2,
		:company_name, :division_name
		)
	end

end

