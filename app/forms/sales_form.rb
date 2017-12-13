
@sales.build_work_address unless @sales.work_address
(2 - @sales.home_address.phones.size).times do
end
(2 - @sales.work address.phones.size).times do
end
end

def assign_attributes(params = {})
end

if inputs_work_address
	sales.work_address.assign_attributes(work_address_params)

	phones = phone params(:work address).fetch(:phones)
	sales.work address.phone.size.times do |index|
		attributes = phones[index.to_s]
		if attributes && attributes[:number].present?
		  sales.work_address.phones[index].assign_attributes(attributes)
		else
		  sales.work_address.phones[index].mark_for_destruction
		end
	end
else
	sales.work_address.mark_for_destruction
end

