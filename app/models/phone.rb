class Phone < ActiveRecord::Base
include StringNormalizer

belongs_to :sale
belongs_to :address

before_validation do
	self.number = normalize_as_phone_number(number)
	self.number_for_index = number.gsub(/\D/, '') if number
end

before_create do
	self.sales = address.sales if address
end

validates :number, presence: true,
	format: {with: /\A\+?\d+(-\d+)*\z/, allow_blank: true }
end

end

