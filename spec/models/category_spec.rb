# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Category, type: :model do

  it "has a valid factory" do
    expect( build(:category)).to be_valid
  end

  subject { build(:category) }

  describe "ActiveRecord relations" do
    it { is_expected.to have_many(:projects) }
  end

  describe "ActiveModel validations" do
    # Basics
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(50) }
  end

end
