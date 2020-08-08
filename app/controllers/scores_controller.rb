class ScoresController < ApplicationController
  def index
    scores = Score.all
    render json: scores
  end

  def show
    score = Score.find(params[:id])
    render json: score
  end

  def create
    score = Score.new(score_params)

    if score.save
      render json: score
      render json: score.errors
    end
  end

  private
    def score_params
      params.require(:score).permit(:wpm, :cpm, :accuracy, :test_id,:errors_count)
    end
end
