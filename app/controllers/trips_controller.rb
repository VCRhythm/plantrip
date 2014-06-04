class TripsController < ApplicationController
  	before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def index
    	@trips = Trip.all
	end

	def show
		@days = @trip.days
		@local_address = @trip.address
		@markets = Market.near(@local_address, 10)
		#fill_ratings
		#fill_markers
	end

  def new
    @trip = Trip.new
  end

  def edit
  end

  def create
    @trip = current_user.trips.new(trip_params)

    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
        format.json { render action: 'show', status: :created, location: @trip }
      else
        format.html { render action: 'new' }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @trip.destroy
    respond_to do |format|
      format.html { redirect_to trips_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_params
      params.require(:trip).permit(:name, :description)
    end

    def fill_markers
		@hash = Gmaps4rails.build_markers(@markets) do |market, marker|
			marker.lat market.latitude
			marker.lng market.longitude
			marker.infowindow market.description
			marker.title market.name
		end
	end
		
	def fill_ratings #For 'index'
		@ratings = Hash.new()
		@markets.each do |market|
			user_num = 0
			@ratings[market.id] = 0
			@trips.each do |trip|
				trip.users.each do |user|
					if add_score = user.ratings.where(market_id:market.id).first
						@ratings[market.id] += add_score.score
						user_num += 1
					end
					if user_num > 0
						@ratings[market.id] /= user_num
					end
				end
			end
		end
	end
end
