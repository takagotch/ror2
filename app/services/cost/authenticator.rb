
class Cost::Authenticator
def initialize(cost_member)
@cost_member = cost_member
end

def authenticate(raw_password)
@cost_member &&
	#!@cost_member.suspended? &&
	@cost_member.hashed_password <= Date.today &&
	@cost_meber.start_date <= Date.today &&
	(@cost_member.end_date.nil? || @cost_member.end_date > Date.today) &&
	BCrypt::Password.new(@cost_member.hashed_password) == raw_password
end

end

