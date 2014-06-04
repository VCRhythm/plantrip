class DaysController < ApplicationController
  	before_action :set_day, only: [:show, :edit, :update, :destroy, :sort]

  	def index
    	@days = @trip.days
		@local_address = @trip.address
		@markets = Market.near(@local_address, 10)
		fill_ratings	
		fill_markers
	end

	def show
		@trip = Trip.find(params[:trip_id])
		@local_address = @trip.address
		@markets = @day.markets
		fill_markers
		@markets = Market.near(@local_address, 10).order(name: :asc)
		fill_ratings2
	end

	def sort
		@sort_group = params['market'].reverse
		@markets = @day.markets
		@rankings = @day.rankings
		@rankings.each do |ranking|
			ranking.position = @sort_group.index(ranking.market_id.to_s) + 1
			ranking.save
		end
		render :nothing => true
	end

	def locate
		@days = Day.all
		@local_address = "28801" #request.location.address
		@markets = Market.near(@local_address, 10) 
		fill_markers
	end

  def new
    @day = Day.new
  end

  def edit
  end

  def create
    @day = current_user.days.new(day_params)

    respond_to do |format|
      if @day.save
        format.html { redirect_to @day, notice: 'Day was successfully created.' }
        format.json { render action: 'show', status: :created, location: @day }
      else
        format.html { render action: 'new' }
        format.json { render json: @day.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @day.update(day_params)
        format.html { redirect_to @day, notice: 'Day was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @day.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @day.destroy
    respond_to do |format|
      format.html { redirect_to days_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_day
      @day = Day.find(params[:id])
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

	def fill_ratings2 #For 'show'
		@ratings = Hash.new()
		@markets.each do |market|
			user_num = 0
			@ratings[market.id] = 0
			@trip.users.each do |user|
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def day_params
      params.require(:day).permit(:name)
    end
end
