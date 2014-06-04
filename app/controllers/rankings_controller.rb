class RankingsController < ApplicationController
  before_action :set_trip_and_day

	def create
    @ranking = Ranking.new(ranking_params)

    respond_to do |format|
      if @ranking.save
        format.html { redirect_to trip_day_path(@trip, @day), notice: 'That activity was successfully added.' }
        format.json { render action: 'show', status: :created, location: @day }
      else
        format.html { redirect_to trip_day_path(@trip, @day), alert:'That activity is already a part of this trip.' }
        format.json { render json: @ranking.errors, status: :unprocessable_entity }
      end
    end
  end

	def destroy
    @day.markets.delete(Market.find(params['market_id']))
    respond_to do |format|
      format.html { redirect_to trip_day_path(@trip, @day) }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def ranking_params
      params.require(:ranking).permit(:rank, :day_id, :market_id)
    end

    def set_trip_and_day
      @trip = Trip.find(params['trip_id'])
      @day = Day.find(params['day_id'])
    end
end
