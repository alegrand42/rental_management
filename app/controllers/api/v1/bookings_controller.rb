class Api::V1::BookingsController < Api::V1::ApiController

  def index
      render json: Booking.all.to_json
  end

  def show
    render json: Booking.find(params['id']).to_json
  end

  private

    def book_params
      params.require(:booking).permit(:start_date, :end_date)
    end
end
