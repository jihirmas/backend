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
class TripDestination < ApplicationRecord
    belongs_to :trip
    belongs_to :destination
end
