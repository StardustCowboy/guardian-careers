class Job < ActiveRecord::Base
	geocoded_by :address
	after_validation :geocode
	belongs_to :user
	belongs_to :company
	has_many :job_applications, dependent: :destroy
end
