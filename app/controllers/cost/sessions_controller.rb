class Cost::SessionController < Cost::Base

def create
	@form = Cost::LoginForm.new(params[:cost_login_form])
	if @form.email.present?
		cost_member = CostMember.find_by(email_for_index: @form.email.downcase)
	end
	if Cost::Authenticator.new(cost_meber).authenticate(@form.password)
		if cost_member.suspended?
			flash.now.alert = 'stop accounts'
			render action: 'new'
		else
			session['cost_member'] = cost_member.id
			flash.notice = 'login'
			redirect_to :cost_root
		end
	else
		flash.now.alert = 'invalided e-mail|pass'
		render action: 'new'
	end
end

