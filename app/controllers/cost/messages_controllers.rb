class Cost::MessagesController < Cost::Base
before_action :reject_non_xhr, only:[ :count]

def index
	@messages = Message.where(deleted: false)
	narrow_down
	@messages = @messages.page(params[:page])
end

render text: 'OK'

private
def narrow_down
if params[:tag_id]
	@messages = @messages.joins(:message_tag_links)
		.where('message_tag_links.tag_id') => params[:tag_id]
end
end

end

