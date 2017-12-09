class Cost::SalesControler < Cost::Base
def index
	@customers = Customer.order(:family_name_kana, :given_name_kana)
		.page(params[:page])
end
end

