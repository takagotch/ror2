class Cost::PasswordsController < Cost::Base
def show
  redirect_to :edit_staff_password
end
end

