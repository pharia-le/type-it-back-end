class TestsController < ApplicationController
  def index
    @tests = Test.all
    render json: @tests.as_json(include: {scores: {only: [:id,:cpm,:wpm,:accuracy]}})
  end

  def show
    @test = Test.find_by_id(params[:id])
    render json: @test.as_json(include: {scores: {only: [:id,:cpm,:wpm,:accuracy]}})
  end
  
  def create
    @test = Test.new(test_params)
    if test.save
      render json: @test.as_json(include: {scores: {only: [:id,:cpm,:wpm,:accuracy]}})
    else
      render json: @test.errors
    end
  end

  private

    def test_params
      params.require(:test).permit(:id,:title,:author,:content,:likes)
    end
end
