class Company < ActiveRecord::Base
  belongs_to :user
  has_many :jobs
  geocoded_by :address
  after_validation :geocode
end
