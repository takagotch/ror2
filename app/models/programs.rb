class Programs < ActiveRecord::Base
	has_many :entries, dependent: :destroy
	has_many :applicants, through: :entries, source: :sales
	belongs_to :registrant, class_name: 'CostMember'

	scope :listing, -> {
	joins(:entries)
		.select('programs.*,COUNT(entries.id) AS number_of_applicants')
		.group('programs.id')
	order(applicantion_start_time: :desc)
		.includes(:registrant)
	}
end

