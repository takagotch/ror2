class Phone < ActiveRecord::Base
include StringNormalizer

belongs_to :sale
belongs_to :address

before_validation do
	self.number = normalize_as_phone_number(number)
	self.number_for_index = number.gsub(/\D/, '') if number
	if number for index && number for index.size >= 4
		self.last_for_digits = number_for_index[-4, 4]
	end
end

before_create do
	self.sales = address.sales if address
end

validates :number, presence: true,
	format: {with: /\A\+?\d+(-\d+)*\z/, allow_blank: true }
end

end

