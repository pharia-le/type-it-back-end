class ScoresController < ApplicationController
  def index
    @scores = Score.all
    render json: @scores.as_json(include: {test: {only: [:id,:title,:author,:content,:likes,:errors_count]}})
  end

  def show
    @score = Score.find(params[:id])
    render json: @score.as_json(include: {test: {only: [:id,:title,:author,:content,:likes,:errors_count]}})
  end

  def create
    @score = Score.new(score_params)

    if @score.save
      render json: @score.as_json(include: {test: {only: [:id,:title,:author,:content,:likes,:errors_count]}})
    else
      render json: @score.errors
    end
  end

  private
    def score_params
      params.require(:score).permit(:wpm, :cpm, :accuracy, :test_id,:errors_count)
    end
end
