class Address < ActiveRecord::Base
	belongs_to :sales

	PERFECTURE_NAMES = %w(
	hokkaido
	tohoku
	tokyo 
	nagoya
	kansai kyoto osaka kobe
	tyugoku
	shikoku
	fukuoka
	abroad US UK GER CHE
	)

before_validation do
	self.postal_code = normalize_as_postal_code(postal_code)
	self.city = normalize_as_name(city)
	self.address1 = normalize_as_name(address1)
	self.address2 = normalize_as_name(address2)
end

