class Program < ActiveRecord::Base
	has_many :entries, dependent: :destroy
	has_many :applicants, through: :entries, source: :sales
	belongs_to :registrant, class_name: 'CostMember'
	
	attr_accessor :application_start_date, :application_start_hour,
		:application_start_minute, :application_end_date, :application_end_hour,
		:application_end_minute

	#performance
	scope :listing, -> {
		joins('LEFT JOIN entries ON programs.id = entried.program_id')
			.select('programs.*,count(entries.id) AS number_of_applicants')
			.group('programs.id')
			.order(application_start_time: :desc)
			.include(:registrant)
	}
end

