class CostMemberFormPresenter < FormPresenter
	def full_name_block(name1, name2, lable_text, options = {})
		markup(:div) do |m|
			m << label(name1, label_text,
				  class: options[:required] ? 'required' :nil)
			m << text_feild(name1, options)
			m << text_feild(name2, options)
		end
	end
end

