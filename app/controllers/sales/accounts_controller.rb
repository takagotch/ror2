class Sales::Acountscontroller < Customer::Base
def show
  @sales = current_sales
end

def edit
	@sales_form = Sale::AccountForm.new(current_sales)
end

def confirm
@sales_form = Sales::AccountForm.new(current_sales)
@sales_form.assign_attributes(params[:form])
if @sales_form.valid?
	render action: 'confirm'
else
	flash.now.alert = 'invalid u input'
	render action: 'edit'
end
end

def update
	@sales_form = Sales::AccountForm.new(current_sales)
	@sales_form.assign_attributes(params[:form])
	if params[:commit]
	  if @sales_form.save
		flash.notice = 'update accounts info'
		redirect_to :cost_account
	  else
		flash.now.alert = 'invalidated input'
		render action: 'edit'
	  end
	else
	  render action: 'edit'
	end
end
end

