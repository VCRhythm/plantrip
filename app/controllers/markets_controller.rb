class MarketsController < ApplicationController
  before_action :set_market, only: [:show, :edit, :update, :destroy]

  # GET /markets
  # GET /markets.json
  def index
    @markets = Market.all
		fill_markers
		respond_to do |format|
			format.html
			format.csv { send_data @markets.to_csv }
		end
  end

	def import
		Market.import(params[:file])
		redirect_to root_url, note: "Markets updated."
	end

	def locate
		@local_address = "28801" #request.location.address
		@markets = Market.near(@local_address, 10) 
		fill_markers
	end

  # GET /markets/1
  # GET /markets/1.json
  def show
  end

  # GET /markets/new
  def new
    @market = Market.new
  end

  # GET /markets/1/edit
  def edit
  end

  # POST /markets
  # POST /markets.json
  def create
    @market = Market.new(market_params)

    respond_to do |format|
      if @market.save
        format.html { redirect_to root_url, notice: 'Activity was successfully created.' }
        format.json { render action: 'show', status: :created, location: @market }
      else
        format.html { render action: 'new' }
        format.json { render json: @market.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /markets/1
  # PATCH/PUT /markets/1.json
  def update
    respond_to do |format|
      if @market.update(market_params)
        format.html { redirect_to @market, notice: 'Market was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @market.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /markets/1
  # DELETE /markets/1.json
  def destroy
    @market.destroy
    respond_to do |format|
      format.html { redirect_to markets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_market
      @market = Market.find(params[:id])
    end
		
		def fill_markers
			@hash = Gmaps4rails.build_markers(@markets) do |market, marker|
				marker.lat market.latitude
				marker.lng market.longitude
				marker.title market.name
			end
		end

    # Never trust parameters from the scary internet, only allow the white list through.
    def market_params
      params.require(:market).permit(:name, :website, :street, :city, :state, :zip, :latitude, :longitude, :description, :image, :rating)
    end
end
