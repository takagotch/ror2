class Cost::MessagesController < Cost::Base
#GET
def count
	render text: SalesMessage.unprocessed.count
end
end

