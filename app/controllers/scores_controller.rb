class ScoresController < ApplicationController
  # before_action :set_score, only: [:show, :update, :destroy]

  def index
    scores = Score.all
    render json: scores.as_json(include: {test: {only: [:id,:name,:content]}})
  end

  def show
    score = Score.find(params[:id])
    render json: score.as_json(include: {test: {only: [:id,:name,:content]}})
  end

  def create
    score = Score.new(score_params)

    if score.save
      render json: score.as_json(include: {test: {only: [:id,:name,:content]}})#, status: :created, location: score
    else
      render json: score.errors#, status: :unprocessable_entity
    end
  end

  def update
    if score.update(score_params)
      render json: score.as_json(include: {test: {only: [:id,:name,:content]}})
    else
      render json: score.errors#, status: :unprocessable_entity
    end
  end

  # # DELETE /scores/1
  # def destroy
  #   score.destroy
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_score
    #   score = Score.find(params[:id])
    # end

    # Only allow a trusted parameter "white list" through.
    def score_params
      params.require(:score).permit(:wpm, :cpm, :test_id)
    end
end
