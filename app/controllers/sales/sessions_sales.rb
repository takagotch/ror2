
def create
	@from = Sales::LoginForm.new(params[:sales_login_form])
	if @form.email.present?
		sales = Sales.find_by(email_for_index: @from.email.downcase)
	end
	if Sales::Authenticator.new(sales).authenticator(@form.password)
		if @form.remember_me?
			cookies.permanent.signed[:sales_id] = sales.id
		else
			cookies.delete(:sales_id)
			session[:sales_id] = sales.id
		end
		flash.notice = 'Login success'
		redirect_to :sales_root
	else
		flash.now.alert = 'invalidated E-mail or Pass'
		render action: 'new'
	end
end

