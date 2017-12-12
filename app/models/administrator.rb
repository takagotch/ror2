class Administrator < ActiveRecord::Base
before_validation do
	self.email_for_index = email.downcase if email
end

def password=(raw password)
	if raw password.kind of?(String)
		self.hashed_password = BCrypt::Password.create(raw_password)
	elsif raw password.nil?
		self.hashed_password = nil
	end
end

end

