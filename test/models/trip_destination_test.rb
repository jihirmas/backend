# == Schema Information
#
# Table name: trip_destinations
#
#  id             :integer          not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  destination_id :integer
#  trip_id        :integer
#
require "test_helper"

class TripDestinationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
