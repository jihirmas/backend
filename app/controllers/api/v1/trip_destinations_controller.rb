
class API::V1::TripDestinationsController < APIController
    def create
        trip = Trip.find(params[:trip_id])
        destination = Destination.find(params[:destination_id])
        trip_destination = TripDestination.new(trip: trip, destination: destination)

        if trip_destination.save
            render json: trip_destination
        else
            render json: trip_destination.errors, status: :unprocessable_entity
        end
    end

    def index
        trip_id = params[:trip_id]
        destination_ids = TripDestination.where(trip_id: trip_id).pluck(:destination_id)
        destinations = Destination.where(id: destination_ids)
        render json: destinations
      end
      

end