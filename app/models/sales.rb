class Sales < ActiveRecord::Base
	include EmailHolder
	include PersonalNameHolder
	include PasswordHolder
end
