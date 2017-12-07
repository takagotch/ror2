
class Sales::Authenticator
	def initialize(sales)
	@sales = sales
	end
	
	def authenticate(raw_password)
		@sales &&
			@sales.hashed_password &&
			BCrypt::Password.new(@sales.hashed_password) == raw_password
	end
end

