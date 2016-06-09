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

FactoryGirl.define do
  factory :project do
    name "MyString"
    description "MyString"
    latitude "9.99"
    longitude "9.99"
    amount 1
  end
end
