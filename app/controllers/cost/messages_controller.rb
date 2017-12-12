class Cost::MessagesController < Cost::Base
before_action :reject_non_xhr, only: [:count]

#GET
def count
	render text: SalesMessage.unprocessed.count
end
end

