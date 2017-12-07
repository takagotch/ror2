class Cost::PasswordsController < Cost::Base
	#...
def update
	@change_password_form = Cost::ChangePasswordForm.new(staff_member_params)
	@change_password_form.object = current_cost_mamber
	if @change_password_form.save
		flash.notice = 'Update Pass'
		redirect_to :staff_account
	else
		flash.now.alert = 'invalidated u input'
		render action: 'edit'
end

private
def staff_member_params
	params.require(:staff_change_password_force).permit(
	:current_password, :new_password, :new_password_confirmation
	)
end
end


