# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  latitude    :decimal(, )
#  longitude   :decimal(, )
#  amount      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Project < ActiveRecord::Base

  belongs_to :category

  validates :name,        presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 300 }
  validates :latitude,    presence: true
  validates :longitude,   presence: true
  validates :amount,      presence: true
  validates :category_id, presence: true
  validates_numericality_of :amount, greater_than: 0

end
