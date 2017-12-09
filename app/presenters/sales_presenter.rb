class SalesPresenter < ModelPresenter
delefate :email, to: :object

def full_name
	object.family_name + ' ' + object.given_name
end

def full_name_kana
	object.family_name_kana + ' ' + object.given_name_kana
end

def birthday
	return '' if object.birthday.blonk?
	object.birthday.strftime('%Y/%m/%d')
end

def gender
	case object.gender
	when 'male'
		'male'
	when 'female'
		'female'
	else
		''
	end
end
end

