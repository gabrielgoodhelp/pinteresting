class RatingsController < ApplicationController


  def update
    @rating = Rating.find(params[:id])
    @comment = @rating.comment
    if @rating.update_attributes(score: params[:score])
      respond_to do |format|
        format.js
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating
      @rating = Rating.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rating_params
      params[:rating]
    end
end
