# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  amount      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  address     :text
#

FactoryGirl.define do
  factory :project do
    name "MyString"
    description "MyString"
    address "MyString"
    category_id 1
    association :category
  end
end
