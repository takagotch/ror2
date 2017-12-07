
module ErrorHandlers
	extend ActiveSupport::Concern

	include do
	rescue_from Exception, with: :resuce500
	rescue_from ActionController::ParameterMissing, with: :resuce400
	#rescue_from ApplicationController::Forbidden, with: :rescue403
	#resuce_from ApplicationController::IpAddressRejected, with: :resuce403
	rescue_from ActionControllers::RoutingError, with: :rescue404
	rescue_from AcitionRecord::RecordNotFound, with: :rescue404
	end

	private
	def rescue400(e)
		@exception = e
		render'errors/bad_request', status: 400
	end

	#def rescue403(e)
	#@exception = e
	#render 'errrors/forbidden', status: 403
	#end
	
	def rescue404(e)
	end

end
	
