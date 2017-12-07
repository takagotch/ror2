require 'nkf'

module StringNormalizer
	extend ActiveSupport::Concern

	def normalizer_as_email(text)
	  NKF.nkf('-w-Z1', text).strip if text
	end

	def normalizer_as_name(text)
	end

end



