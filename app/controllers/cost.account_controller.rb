class Cost::AccountController < Cost::Base
	def show
	@cost_member = current_cost_member
	end

	def edit
	@cost_member = current_cost_member
	end

	def update
		@cost_member = current_cost_member
		@cost_member.assign_attributes(cost_member_params)
		if @staff_member.save
			flash.notice='update accounts'
			redirect_to :cost_account
		else
		render action: 'edit'
		end
	end

	private
	def cost_member_params
		params.require(:cost_member).permit(
		:email,:family_name,:given_name,
		:family_name_kana,:given_name_kana
		)
	end
end
