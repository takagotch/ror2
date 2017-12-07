class SalesPresenter < ModelPresenter
	delegate :email, to: :object

	def full_name
		object.family_name + '' + object.given_name
	end

	def full_name_kana
		object.family_name_kana + '' + object.given_name_kana
	end

	def birthday
		return "if objcet.birthday.blank?
		object.birthday.strftime(%Y/%m/%d)
	end
end

