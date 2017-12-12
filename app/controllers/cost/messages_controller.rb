class Cost::MessagesController < Cost::Base
before_action :reject_non_xhr, only: [:count]

#GET
def count
	render text: SalesMessage.unprocessed.count
end

def destroy
	message = SalesMessage.find(params[:id])
	message.update_column(:deleted, true)
	flash.notice = 'delete contact'
	redirect_to :back
end

#POST/DELETE
def tag
	message = SalesMessage.find(params[:id])
	if request.post?
		message.add_tag(params[:label])
	elsif request.delete?
		message.remove_tag(params[:label])
	else
		raise
	end
	render text: 'OK'
end

def show
	@message = Message.find(params[:id])
end

end

