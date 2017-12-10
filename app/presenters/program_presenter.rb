class ProgramPresenter < ModelPresenter
	delegate :title, :desctiption, to: :object
	delegate :number_with_delimiter, :button_to, to: :view_context

	def application_start_time
		object.application_start_time.strftime('%Y-%m-%d %H:%M')
	end

	def application_end_time
		object.application_end_time.strftime('%Y-%m-%d %H:%M')
	end

	def max_number_of_participants
		if object.max_number_of_participants
			number_with_delimiter(object.max_number_of_participants)
		end
	end

	def min_number_of_participants
		if object.min_number_of_participants
			number_with_delimiter(object.min_number_of_participants)
		end
	end

	def number_of_applicats
		#number_with_delimiter(object.applicants.count)
		#number_with_delimiter(object.entries.count)
		number_with_delimiter(object.number_of_applicants)
	end

	def registrant
		object.registrant.family_name + '' + object.registrant.given__name
	end

	def apply_or_cancel_button
		closed = object.application end time < Time.current
		label_text = closed? 'sold out' : 'on sales'
		button_to label_text, [:sales, object, :entries],
	          disabled: closed, method: :post,
		  data: {confirm: 'confirm to apply'}
	end
	
end

