class DateStringValidator < ActiveModel::Validator
	def validate_each(record, attribute, value)
		Date.parse(balue)if value.present?
	rescue ArgumentError
		record.errors.add(attribute, :invalid)
	end
end

