class Api::V1::ListingsController < Api::V1::ApiController

  def create
    render json: Listings.gather_data.to_json
  end

  def index
      render json: Listing.all.to_json
  end

  def show
    render json: Listing.find(params['id']).to_json
  end

  private

    def house_params
        params.require(:listing).permit(:num_rooms)
    end
end
