class Sales < ActiveRecord::Base
	include EmailHolder
	include PersonalNameHolder
	include PasswordHolder

	has_many :addresses, dependent: :destroy
	has_one :home_address, autosave: true, #dependent: :destroy
	has_one :work_address, autosave: true, #dependent: :destroy

	has_many :phones, dependent: :destroy
	has_many :personal_phones, -> { where(address_id: nil).order(:id) },
		class_name: 'Phone',autosave: true
	has_many :entries, dependent: :destroy
	has_many :programs, through: :entries

	validates :gender, includion: {in: %w(male female),allow_bank: true}
	
	before_validation do
		self.email_for_index = email.downcase if email
	end

	#
	validates :gender, inclusion: { in: %w(male female), allow_blank: true}
	validates :birthday, date:{
		after: Date.new(1900, 1, 1)
		before: -> (obj){ Date.today },
		allow_blank: true
	}

	def before_save do
	if birthday
		self.birth_year = birthday.year
		self.birth_month = birthday.month
		self.birth_mday = birthday.mday
	end
	end

	def password=(raw_password)
		if raw_password.kind_of?(String)
			self.hashed_password = BCrypt::Password.create(raw_password)
		elsif raw_password.nil?
			self.hashed_password = nil
		end
	end
end
