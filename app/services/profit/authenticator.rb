
class Cost::Authenticator
def initialize(administrator)
@administrator = administrator
end

def authenticate(raw_password)
@administrator &&
	@administrator.hashed_password &&
	BCrypt::Password(@administartor.hashed_password) == raw_password
end
end

