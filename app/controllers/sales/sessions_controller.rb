
class Sales::SessionsController < Sales::Base
	skip_before_action :authorize

	def new
	if current_sales
		redirect_to :sales_root
	else
		@form = Sales::LoginForm.new
		render action: 'new'
	end
	end

	def create
		@form = Sales::LoginForm.new(params[:sales_login_form])
		if @form.email.present?
			sales = Sales.find_by(email_for_index: @form.email.downcase)
		end
		if Sales::Authenticator.new(sales).authenticate(@from.password)
			session[:sales_id] = sales.id
			flash.notice = 'Login success'
			redirect_to :sales_root
		else
			flash.now.alert = "invalid E-mail or Pass"
			render action: 'new'
		end

	end
	
	def destroy
        session.delete(:customer_id)
	flash.notice = 'Logout '
	redirect_to :customer_root
	end
end



