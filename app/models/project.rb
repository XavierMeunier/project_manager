class Project < ActiveRecord::Base

  validates :name,        presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 300 }
  validates :latitude,    presence: true
  validates :longitude,   presence: true
  validates :amount,      presence: true
  validates_numericality_of :amount, greater_than: 0

end