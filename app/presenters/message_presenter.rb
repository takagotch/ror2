class MessagePresenter < ModelPresenter
	deleaget :subject, :body, to: :object
def type
case object
when SalesMessage
	'Contact'
when CostMessage
	'reply'
else
	raise
end
end

def sender
case object
when SalesMessage
	object.sales.family_name + '' + object.sales.given_name
when CostMessage
	object.cost_mumber.family_name + '' _ object.cost_member.given_name
else
	raise
end
end

def receiver
	case object
	when SalesMessage
		''
	when CostMessage
		object.sales.family_name + '' + object.customer.given_name
	else
		raise
	end
end

def trancated_subject
	view_context.truncate(subject, length: 20)
end

def created_at
	if object.created_at > Time.current.midnight
		object.created_at.strftime('%H:%M:%S')
	elsif object.created_at > 5.months.ago.beginning_of_month
		object.created_at.strftime('%m/%d %H:%M')
	else
		object.created_at.strftime('%Y/%m/%H:%M')
	end
end

end

