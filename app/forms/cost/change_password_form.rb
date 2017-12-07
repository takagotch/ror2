class Cost::ChengePasswordForm
include ActiveModel::Model

attr_accessor :object, :current_password, :new_password,
	:new_password_confirmation
validates :new_password, presence: true, confirmation: true

validate do
	unless Cost::Authenticator.new(object).authenticate(current_password)
		errors.add(:current_password, :wrong)
end


def save
	if vaid?
	object.password = new_password
	object.save!
	end
	end

end


