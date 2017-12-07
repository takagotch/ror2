class Sales::LoginForm
	include ActiveModel::Model

	attr_accessor :email, :password

	def remember_me?
	remember_me == '1'
	end

end

