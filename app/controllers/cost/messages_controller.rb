class Cost::MessagesController < Cost::Base
before_action :reject_non_xhr, only: [:count]

def index
	@messages = Messages.where(delete: false)#.page(params[:page])
	if params[:tag_id]
	  @messages = @messages.joins(:message_tag_links)
		  .where('message_tag_links.tag_id' => params[:tag_id])
	end
	@messages = @messages.page(params[:page])
end

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

#GET
def inbound
  @messages = SalesMessage.where(deleted: false)#.page(params[:page])
  narrow_down
  @messages = @messages.page(params[:page])
  render action: 'index'
end

#GET
def outbound
  @messages = CostMessage.where(deleted: false)#.page(params[:page])
  narrow_down
  @messges = @messages.page(params[:page])
  render action: 'index'
end

#GET
def deleted
	@messages = Mesage.where(deleted: true)#.page(params[:page])
	narrow_down
	@messages = @messages.page(params[:page])
	render action: 'index'
end

end

