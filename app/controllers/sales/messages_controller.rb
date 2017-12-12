class Sales::MessageController < Sales::Base
def index
	@messages = current_sales.inbound_messages.page(params[:page])
		.where(discarded: false).page(params[:page])
	#...
        #else
	#  render action: 'new'
	#  end
end

def show
	@messages = current_sales.inbound_messages.find(params[:id])
end

def new
	@message = SalesMessage.new
end

def destroy
	message = CostMessage.find(params[:id])
	message.update_column(:discarded, true)
	flash.notice = 'delete msg'
	redirect_to :back
end

def confirm
	@message = SalesMessage.new(sales_message_params)
	if @message.valid?
		render ation: 'confirm'
	else
		flash.now.alert = 'invalided u inputs'
		render action: 'new'
	end
end

def create
	@message = SalesMessage.new(sales_message_params)
	if params[:commit]
	  @message.sales = current_sales
	  if @message.save
		flash.notice = 'ENTER'
		redirect_to :sales_root
	  else
		flash.now.alert = 'invalided u inputs'
		render action: 'new'
	  end
	else
		recder action: 'new'
	end
end

private
def sales_message_params
	params.require(:sales_message).permit(:subject, :body)
end

end

