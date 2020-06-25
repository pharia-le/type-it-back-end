class ScoresController < ApplicationController
  def index
    @scores = Score.all
    render json: @scores.as_json(include: {test: {only: [:id,:title,:author,:content,:likes]}})
  end

  def show
    @score = Score.find(params[:id])
    render json: @score.as_json(include: {test: {only: [:id,:title,:author,:content,:likes]}})
  end

  def create
    @score = Score.new(score_params)

    if @score.save
      render json: @score.as_json(include: {test: {only: [:id,:title,:author,:content,:likes]}})#, status: :created, location: score
    else
      render json: @score.errors
    end
  end

  private
    def score_params
      params.require(:score).permit(:wpm, :cpm, :accuracy, :test_id)
    end
end
