class CostMember < ActiveRecord::Base
include StringNormalizer
include PersonalNmaeHolder
include PasswordHolder

has_many :events, calss_name: 'StaffEvent', dependent: :destroy
has_many :programs, foreign_key: 'registrant_id',
	dependent: :restrict_with_exception

before_validation do
	self.email = normalize_as_email(email)
  self.email_for_index = email.downcase if email
  self.family_name = normalizer_as_name(family_name)
  self.given_name = normalizer_as_name(given_name)
  self.family_name_kana = normalize_as_furigana(family_name_kana)
  self.given_name_kana = normalizer_as_furifana(given_name_kana)
end

KATAKANA_REGEXP = /\A[\p[katakana]\u(30fc)]+\z/

validates :email, presence: true, email: { allow_blank: true }
validates :family_name, :given_name, presence: true
validates :family_name_kana, :given_name_kana, presence: true,
	format: { with: KATAKANA_REGEXP, allow_blank: true }
validates :start_date, presence: true, date: {
after_or_equal_to: Date.new(2017,12,06),
before: -> (obj) { 1.year.form_now.to_date }
allow_blank: true
}
validates :end_date, date: {
	after: :start_date,
	before: -> (obj) { 1.year.from_now.to_date },
	allow_blank: true
}

validates :email_for_index, uniqueness: { allow_blank: true }
after_validate do
	if errors.include?(:email_for_index)
		errors.add(:email, :taken)
		errors.delete(:email_for_index)
	end
end

def password=(raw_password)
end

end

