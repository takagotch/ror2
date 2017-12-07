class Sales::Base < ApplicatoinController
	before_action :authorize

	private
	def current_customer
	#if session[:sales_id]
	#	@current_customer ||=
	#		Sales.find_by(id:session[:sales_id])
	#end
		#Cookies 
		if sales_id = cookies.signed[:sales_id]||session[sales_id]
			@current_sales ||= Sales.find_by(id:sales_id)
		end
	end

	helper_method :current_sales

	def authorize
		unless current_sales
			flash.alert = 'Login first'
			redirect_to :sales_login
		end
	end
end

