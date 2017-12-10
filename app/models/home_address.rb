class HomeAddress < Address
	validates :postal_vode, :prefecture, :city, :address1, prsence: true
	validates :company_name, :division_name, absence: true
end

