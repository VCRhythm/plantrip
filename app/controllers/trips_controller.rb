class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  # GET /trips
  # GET /trips.json
  def index
    @trips = Trip.all
		@local_address = "28801"
		@markets = Market.near(@local_address, 10)
		fill_markers
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
		@local_address = "28801" #request.location.address
		@markets = @trip.markets
		fill_markers
		@markets = Market.order(rating: :desc, name: :asc)
  end

	def sort
		@trip = Trip.find(params[:trip_id])
		@sort_group = params['market'].reverse
		@markets = @trip.markets
		@rankings = @trip.rankings
		@rankings.each do |ranking|
			ranking.position = @sort_group.index(ranking.market_id.to_s) + 1
			ranking.save
		end
		render :nothing => true
	end

	def locate
		@trips = Trip.all
		@local_address = "28801" #request.location.address
		@markets = Market.near(@local_address, 10) 
		fill_markers
	end

  # GET /trips/new
  def new
    @trip = Trip.new
  end

  # GET /trips/1/edit
  def edit
  end

  # POST /trips
  # POST /trips.json
  def create
    @trip = Trip.new(trip_params)

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

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json
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

  # DELETE /trips/1
  # DELETE /trips/1.json
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

		def fill_markers
			@hash = Gmaps4rails.build_markers(@markets) do |market, marker|
				marker.lat market.latitude
				marker.lng market.longitude
				marker.infowindow market.description
				marker.title market.name
			end
		end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_params
      params.require(:trip).permit(:name)
    end
end
