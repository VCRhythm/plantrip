class RankingsController < ApplicationController
  
	def create
		@trip=Trip.find(params['trip_id'])
    @ranking = Ranking.new(market_id: params['market_id'], trip_id: params['trip_id'])

    respond_to do |format|
      if @ranking.save
        format.html { redirect_to @trip, notice: 'Market was successfully created.' }
        format.json { render action: 'show', status: :created, location: @trip }
      else
        format.html { render action: 'new' }
        format.json { render json: @ranking.errors, status: :unprocessable_entity }
      end
    end
  end

	def destroy
		@trip=Trip.find(params['trip_id'])
    @trip.markets.delete(Market.find(params['market_id']))
    respond_to do |format|
      format.html { redirect_to @trip }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def ranking_params
      params.require(:ranking).permit(:rank, :trip_id, :market_id)
    end

end
