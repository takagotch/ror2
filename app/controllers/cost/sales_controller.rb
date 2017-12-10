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

def create
	@sales_form = Cost::SalesForm.new
	@sales_form.assign_attributes(params[:form])
	if @sales_form.save
		flash.notice = 'add sales'
		redirect_to action: 'index'
	else
		flash.notice = 'invalidated u input'
		render action: 'new'
	end
end

def update
	@sales_form = Cost::SalesFrom
	@sales_form.assign_attributes(params[:form])
	if @sales_form.save
		flash.notice = 'update sales info'
	else
		flash.notice = 'invalidated u input'
		render action 'edit'
	end
end

def destroy
	sales = Sales.find(params[:id])
	sales.destroy!
	flash.notice = 'delete sales'
	redirect_to :cost_sales
end

end

