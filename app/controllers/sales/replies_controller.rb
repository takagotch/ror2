class Sales::RepliesController < Sales::Base
  before_action :prepare_message

def new
	@reply = SalesMessage.new
end

def confirm
	@reply = SalesMessage.new(sales_message_params)
	if @reply.valid?
		render action: 'confirm'
	else
		flash.now.alert = 'invalid u inputs'
		render action 'new'
	end
end

def create
	@reply = SalesMessage.new(sales_message_params)
	if params[:commit]
		@reply.parent = @message
		if @reply.save
			flash.notice = 'reply msg'
			redirect_to :sales_messages
		else
			flash.now.alert = 'invalid u inputs'
			render action: 'new'
		end
	else
		render action: 'new'
	end
end

private
def prepare_message
	@message = costMessage.find(params[:message_id])
end

def sales_message_params
	params.require(:sales_mesage).permit(:subject, :body)
end

end

