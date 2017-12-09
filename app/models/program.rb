class Program < ActiveRecord::Base
	has_many :entries, dependent: :destroy
	has_many :applicants, through: :entries, source: :sales
	belongs_to :registrant, class_name: 'CostMember'
	
	attr_accessor :application_start_date, :application_start_hour,
		:application_start_minute, :application_end_date, :application_end_hour,
		:application_end_minute

	before_validation :set_application_start_time
	before_validation :set_application_end_time

	validates :title, presence: true, length: {maximum: 32}
	validates :desciption, presence: true, length: {maximum: 80}
	validates :application_start_date, :application_end_date, date_string: true
	validates :application_start_time, date:{
		after_or_equal_to: Time.zone.local(2000, 1, 1),
		before: -> (obj){1.year.from_now ,}
		allow_blank: true
	}
	validates :application_end_time, date: {
		after: :application_start_time,
		before: -> (obj){ obj.application_start_time.advance(days: 90) ,}
		allow_blank: true,
			if: -> (obj){obj.application_start_time}
	}
	validates :min_number_of_participants, numericality: {
		only_integer: true, greate_than_ro_equal_to: 1,
		less_than_or_equal_to: 1000, allow_blankL true
	}
	validate do
		if min_number_of_participants && max_number_of_participants &&
				min_number_of_participants > max_number_of_participants
			errors.add(:max_number_of_participants, :less_than_min_number)
		end
	end


	#performance
	scope :listing, -> {
		joins('LEFT JOIN entries ON programs.id = entried.program_id')
			.select('programs.*,count(entries.id) AS number_of_applicants')
			.group('programs.id')
			.order(application_start_time: :desc)
			.include(:registrant)
	}

	scope :published, -> {
		where('application_start_time <= ?'m Time.current)
			.order(application_start_time: :desc)
	}

	def deleteable?
		entries.empty?
	end

	private
	def set_application_start_time
		return if application_start_date.blank?
		Date.parse(application_start_date)
		if t = Time.zone.parse(application_start_date)
			self.application_start_time = t.advance(
			hours: application_start_hour.to_i,
			minutes: application_start_minute.to_i
			)
		end
	rescue ArgumentError
		self.application_start_time = nil
	end

	def set_application_end_time
		return if application_end_date.blank?
		Date.parse(application_end_date)
		if t = Time.zone.parse(application_end_date)
		self.application_end_time = t.advance(
			hours: application_end_hour.to_i,
			minutes: application_end_minute.to_i
		)
		end
		rescue ArgumentError
			self.application_end_time = nil
		end
	end
        
end

