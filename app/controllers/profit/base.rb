class Profit::Base < ApplicationController
before_action :authorize
before_action :check_account
before_action :check_timeout

private


def current_administrator
	if session[:administrator_id]
		@current_addministrator ||=
			Administrator.find_by(id: session[:administrator_id])
	end
end
  helper_method :current_administrator
end

def check_account
	if current administrator && current_administrator.suspended?
		session.delete(:administrator id)
		flash.alert = 'invalided accoutns'
		redirect_to :profit_root
	end
end

TIMEOUT = 60.minutes

def timeout
	if current administrator
		if session[:last access time] >= TIMEOUT.ago
			session[] = Time.current
		else
			session.delete(:administrator id)
			flash.alert = 'Session timeout'
			redirect_to :profit_login
		end
	end
end

end

