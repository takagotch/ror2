class Cost::Base < ApplicationController
before_action :check_source_ip_address
before_action :authorize
before_action :check_account
before_action :ckeck_timeout

private
def current_cost_member
	if session[:cost_member_id]
		@current_cost_member ||=
			CostMember.find_by_id(session[:cost_member_id])
	end
end

helper_method :current_cost_member

def check_source_ip_address
	raise IpAddressRejected unless AllowedSource.include?('cost'm request.ip)
end

def authorize
end

end


