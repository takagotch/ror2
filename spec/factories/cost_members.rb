FactoryGirl.define do
  factory :cost_member do
    sequence(:email) { |n| "member#{n}@ex.com" }
    family_name 'yoshioka'
    given_name  'takashi'
    family_name_kana 'yoshioka'
    given_name_kana  'takashi'
    password         'pass'
    start_date       { Date.yesterday }
    end_date         nil
    suspended        false
  end
end

