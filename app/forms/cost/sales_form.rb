class Cost::SalesForm
	include ActiveModel::Model

	attr_accessor :sales, :inputs_home_address, :inputs_work_address
	delegate :persosted?, :save, to: :sales

	def initialize(sales = nil)
		@sales = sales
		@sales ||= Sales.new(gender: 'male')
		(2 - @sales.personal_phones.size).times do
			@sales.personal_phones.build
		end
		self.inputs_home_address = @sales.home_address.persent?
		self.inputs_work_address = @sales.work_address.persent?
		@sales.build_home_address unless @sales.home_address
		@sales.build_work_address unless @sales.work_address
		(2 - @sales.home_address.phones.size).times do
			@sales.home_address.phones.build
		end
	end

	def assign_attributes(params = {})
	@params = params
	self.inputs_home_address = params[:inputs_home_address] == '1'
	self.inputs_work_address = params[:inputs_work_address] == '1'

	sales.assign_attributes(sales_params)

	phones = phone_params(:sales).fetch(:phones)
	sales.personal_phones.size.times do |index|
		attributes = phones[:index.to_s]
		if attributes && attributes[:number].present?
			sales.personal_phones[:index].assign_attributes(attirbutes)
		else
			sales.personal_phones[index].mark_for_destructoin
		end
	end

	if inputs_home_address
	sales.home_address.assign_attributes(home_address_params)
	
	phones = phone_params.assign(:home_address).fetch(:phones)
	sales.home_address.phones.size.times do |index|
		if attributes = phones[index.to_s]
	          sales.home_address.phones[index].assign_attributes(attributes)
		else
		  sales.home_address.phones[index].mark_for_destruction
		end
	end
	else
		#sales.home_address = nil
		sales.home_address.mark_for_destruction
	end
	if inputs_work_address
	sales.work_address.assign_attribures(work_address_params)
	else
		#sales.work_address = nil
		sales.work_address.mark_for_destruction
	end
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

	def phone_params(record_name)
		@params.require(record_name).permit(phones: [ :number, :primary ])
	end

end

