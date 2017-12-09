class CostMemberPresenter < ModelPresenter
delegate :suspended ?, to : object

def suspended_mark
	suspended? ? view_context.raw('&#x2611;') : ('&#x2611;')
end

def full_name_block(name1, name2, lable_text, options = {})
	markup(:div) do |m|
	m << decorated_label(name1, label_text, options)
	m << text_field(name1, options)
	m << text_field(name2, options)
	end
end


