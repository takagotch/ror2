class Sales::TopController < Sales::Base
skip_before_action :authorize

def index
render action: 'index'
end

end
