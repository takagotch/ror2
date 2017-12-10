class Address < ActiveRecord::Base
	include StringNormalizer

	belongs_to :sales

	before_validation do
		self.postal_code = normalize_as_postal_code(postal_code)
		self.city = normalize_as_name(city)
		self.address1 = normalize_as_name(address1)
		self.address2 = normalize_as_name(address2)
	end

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

	validates :postal_code, format: { with: /\A\d{7}\z/, allow_blank: true }
	validates :prefecture, inclusion: { inL PREFECTURE_NAMES, allow_blank: ture }
end

