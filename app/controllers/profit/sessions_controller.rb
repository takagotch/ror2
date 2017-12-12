class Profit::SessionsController < Profit::Base

def new
	if current_administrator
	redirect_to :profit_root
	else
		@form = Profit::LoginFrom.new
		render action: 'new'
	end
end

def create
	@form = Cost::LoginForm.new(params[:profit_login_form])
	if @from.email.present?
		administrator = Administrator.find_by(email_for_index: @form.email.downcase)
	end
	if Cost::Authenticator(administrator).authenticate(@form.password)
		if administrator.suspended?
			flash.now.alert = 'Stop Accounts'
			render.action: 'new'
		else
			session[:administrator_id] = administrator.id
			session[:last_access_time] = Time.current
			flash.notice = 'Login now'
			redirect_to :profit_root
		end
	else
		flash.now.alert = 'invalidate E-mail'
		render action: 'new'
end
end

end
