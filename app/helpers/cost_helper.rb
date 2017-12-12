module CostHelper
	include HtmlBuilder

	def number_of_unprocessed_messages
	markup do |m|
		m.a(hrefL '#') do
		m << 'new contact'
		if(c = SalesMessage.unprocessed.count) > 0
			anchor_text = "(#{c})"
		else
			anchor_text = ''
		end
		m.span(anchor_text, id: 'number-of-unprocessed-messages')
		end
	end
	end
end

