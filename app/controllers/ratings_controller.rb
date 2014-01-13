class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :update, :destroy]

  # GET /ratings
  # GET /ratings.json
  def index
    @ratings = Rating.all
  end

  # GET /ratings/1
  # GET /ratings/1.json
  def show
  end

  # GET /ratings/new
  def new
		begin
	 		rand_id = rand(1..Market.count)
			@market = Market.find(rand_id)
		end while current_user.ratings.where(market_id:@market.id).exists? 
    @rating = Rating.new(score:0)
  end

  # GET /ratings/1/edit
  def edit
  end

  # POST /ratings
  # POST /ratings.json
  def create
    @rating = current_user.ratings.create(score: params['score'], market_id: params['market'])

    render js: %(window.location.pathname='#{new_rating_path}')
  end

  # PATCH/PUT /ratings/1
  # PATCH/PUT /ratings/1.json
  def update
    respond_to do |format|
      if @rating.update(rating_params)
        format.html { redirect_to @rating, notice: 'Rating was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ratings/1
  # DELETE /ratings/1.json
  def destroy
    @rating.destroy
    respond_to do |format|
      format.html { redirect_to ratings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating
      @rating = Rating.find(params[:id])
	  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rating_params
 		 params.require(:rating).permit(:score, :user_id, :market_id)
    end
end
