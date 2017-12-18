FactoryGirl.define do
factory :home_address do
postal_code '1000000'
prefecture 'Osaka'
city 'kitaku'
address1 'ofukatyo'
address2 '2-2'
end

factory :work_address do
company_name 'test'
division_name 'dev division'
postal_code '1060000'
prefecture 'osaka'
city 'kitaku'
address1 'ofukatyo'
address2 '2-2'
end

end
