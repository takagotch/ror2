class CostMember < ActiveRecord::Base
include StringNormalizer
has_many :events, calss_name: 'StaffEvent', dependent: :destroy

before_validation do
  self.email_for_index = email.downcase if email
  self.family_name = normalizer_as_name(family_name)
  self.given_name = normalizer_as_name(given_name)
  self.family_name_kana = normalize_as_furigana(family_name_kana)
  self.given_name_kana = normalizer_as_furifana(given_name_kana)
end

KATAKANA_REGEXP = /\A[\p[katakana]\u(30fc)]+\z/

end

