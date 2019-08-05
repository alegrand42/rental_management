class Api::V1::ReservationsController < Api::V1::ApiController

  def index
      render json: Reservation.all.to_json
  end

  def show
    render json: Reservation.find(params['id']).to_json
  end

  private

    def house_params
      params.require(:reservation).permit(:start_date, :end_date)
    end
end
