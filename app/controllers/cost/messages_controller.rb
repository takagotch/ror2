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

end

