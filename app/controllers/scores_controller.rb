class ScoresController < ApplicationController
  # before_action :set_score, only: [:show, :update, :destroy]

  def index
    scores = Score.all
    options = {
      include: [:test]
    }
    render json: ScoreSerializer.new(scores,options)
  end

  def show
    score = Score.find(params[:id])
    options = {
      include: [:test]
    }
    render json: ScoreSerializer.new(score,options)
  end

  def create
    score = Score.new(score_params)

    if score.save
      options = {
        include: [:test]
      }
      render json: ScoreSerializer.new(score,options)#, status: :created, location: score
    else
      render json: score.errors#, status: :unprocessable_entity
    end
  end

  def update
    if score.update(score_params)
      options = {
        include: [:test]
      }
      render json: ScoreSerializer.new(score,options)
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
