class Api::V1::MissionsController < Api::V1::ApiController

  def index
      render json: Mission.all.to_json
  end

  def show
    render json: Mission.find(params['id']).to_json
  end

  private

    def mission_params
      params.require(:mission).permit(:mission_type, :date, :price)
    end
end
