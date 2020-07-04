class TestsController < ApplicationController
  def index
    @tests = Test.all
    render json: @tests.as_json(include: {scores: {only: [:id,:cpm,:wpm,:accuracy,:errors_count]}})
  end

  def show
    @test = Test.find_by_id(params[:id])
    render json: @test.as_json(include: {scores: {only: [:id,:cpm,:wpm,:accuracy,:errors_count]}})
  end

  def update
    @test = Test.find_by_id(params[:id])
    if @test.update(test_params)
      render json: @test.as_json(include: {scores: {only: [:id,:cpm,:wpm,:accuracy,:errors_count]}})
    else
      render json: @test.errors
    end
  end

  private

    def test_params
      params.require(:test).permit(:id,:title,:author,:content,:likes)
    end
end
