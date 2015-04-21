class Account < ActiveRecord::Base
  belongs_to :user
  has_many :job_applications
  mount_uploader :resume, ResumeUploader
  mount_uploader :transcript, TranscriptUploader

end
