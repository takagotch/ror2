class ConfirmingSalesFormPresenter < ConfirmingUserFormPresenter
def birthday_field_block(name, label_text, options= {})
	markup(:div, class: 'input-block') do |m|
		m << decorated_label(name, label_text, options)
		m.div(object.send(name), class: 'field-value')
		m << hidden_field(name)
	end
end

def gender_field_block
markup(:div, class: 'input-block') do |m|
	m << decorated_label(:gender, 'gender')
	m.div(object.gender == 'male' ? 'male': 'female', class: 'fieled-value' )
	m << hidden_field(:gender)
end
end

end

