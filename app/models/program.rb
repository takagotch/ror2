class Program < ActiveRecord::Base
	has_many :entries, dependent: :destroy
	has_many :applicants, through: :entries, source: :sales
	belongs_to :registrant, class_name: 'CostMember'
end

