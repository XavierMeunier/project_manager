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

require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
