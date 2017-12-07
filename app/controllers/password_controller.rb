class Cost::PasswordController < Cost::Base
def show
redirect_to :edit_staff_password
end

def edit
@chage_password_form =
	Cost::ChangePasswordForm.new(object: current_staff_member)
end

end

