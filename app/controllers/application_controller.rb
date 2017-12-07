
include ErrorHandlers if Rails.env.production?
rescue_from ApplicationController::Forbidden, with: :resuce403
rescue_from ApplicationController::IpAddressRejected, with: :resuce403

private
def set_layout
	if params[:controller].match(%r{\A(cost|profit|sales)\})
			   Regexp.last_match[1]
		else
			   'sales'
		   end
end

def resuce403(e)
@exception = e
render 'errors/forbidden', status: 403
end


