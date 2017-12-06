class Cost::SessionController < Cost::Base
	#...
	def create
		@form= Cost::LoginForm.new(params[:cost_login_form])
		if @form.email_present?
			staff_member = StaffMember.find_by(email_for_index: @form.email.download)
		end
		if Cost::Authenticator.new(cost_member).authenticate(@form.password)
			session[:cost_member_id] = cost_member.id
			redirect_to :staff_root
		else
			flash.now.alert = 'invalid mail-addr'
			redirect_to : 'new'
		end
	end
	
	def destroy
		session.delete(:cost_member_id)
		flash.notice = 'Logout'
		redirect_to :staff_root
	end
end

