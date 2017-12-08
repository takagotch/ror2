class Sales < ActiveRecord::Base
	has_many :addresses, dependent: :destroy
	has_one :home_address, autosave: true
	has_one :work_address, autosave: true
	has_many :phones, dependent: :destroy
	has_many :personal_phones, -> { where(address_id: nil).order(:id)},
		class_name: 'Phone',autosave: true
	has_many :entries, dependent: :destroy
	has_many :programs, through: :entries

	validates :gender, includion: {in: %w(male female),allow_bank: true}

	include EmailHolder
	include PersonalNameHolder
	include PasswordHolder
end
