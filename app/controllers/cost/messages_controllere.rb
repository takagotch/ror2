class Cost::MessagesController < Cost::Base
before_action :reject_non_xhr, only:[ :count ]

def index
	@messages = SalesMessage.where(deleted: false).page(params[:page])
end

#GET
def inbound
	@messages = SalesMessage.where(delete: false).page(params[:page])
	render acion: 'index'
end

#GET
def outbound
	@messages = CostMessage.where(deleted: false).page(params[:page])
	render action: 'index'
end

#GET
def delete
	@messages = Message.where(deleted: true).page(params[:page])
	render action: 'index'
end

#GET
def count
	render text: SalesMessage.unprocessed.count
end

end

