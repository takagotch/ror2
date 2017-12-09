class Cost::TopController < Cost::Base
skip_before_action :authorize

def index
	if current_cost member
		render action: 'dashboard'
	else
		render action: 'index'
	end
end

end

