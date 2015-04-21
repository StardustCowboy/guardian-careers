class JobApplication < ActiveRecord::Base
	belongs_to :job
	belongs_to :account
	belongs_to :user

	#mount_uploader :license, LicenseUploader
	
	#validates_presence_of :resume
	#validates_presence_of :transcript
	#validates_presence_of :license
end
