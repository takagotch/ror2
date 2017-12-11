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

private
#...

end

