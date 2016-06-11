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

require 'rails_helper'

RSpec.describe Project, type: :model do

  it "has a valid factory" do
    expect( build(:project)).to be_valid
  end

  subject { build(:project) }

  describe "ActiveRecord relations" do
    it { is_expected.to belong_to(:category) }
  end

  describe "ActiveModel validations" do
    # Basics
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:amount) }
    it { should validate_presence_of(:category_id) }
    it { should validate_numericality_of(:amount) }
  end

end
