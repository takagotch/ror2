class Cost::SalesControler < Cost::Base
def index
	@sales = Sales.order(:family_name_kana, :given_name_kana)
		.page(params[:page])
end

def show
	@sales = Sales.find(params[:id])
end

def new
	@sales_form = Cost::SalesForm.new
end

def edit
	@sales_form = Cost::SalesForm.new(Sales.find(params[:id]))
end

end

