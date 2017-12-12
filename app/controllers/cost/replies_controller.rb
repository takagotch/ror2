class Cost::RepliesControllers < Cost::Base
before_action :prepare_message

def new
	@reply = CostMessage.new
end

def create
	@reply = CostMessage.new(cost_message_params)
	if params[:commit]
		@reply.cost_member = current_cost_member
		@reply.parent = @message
		if @reply.save
			flash.notice = 'reply'
			redirect_to :outbound_cost_messages
		else
			flash.now.alert = 'invalided u inputs'
			render action: 'new'
		end
	else
		render action: 'new'
	end
end

#POST
def confrim
	@reply = CostMessage.new(cost_message_params)
	if @reply.valid?
		render action: 'confirm'
	else
		flash.now.alert = 'invalided u inputs'
		render action: 'new'
	end
end

private
def prepare_message
	@message = CostMessage.find(params[:message_id])
end

def cost_message_params
	params.require(:cost_message).permit(:subject, :body)
end

end

