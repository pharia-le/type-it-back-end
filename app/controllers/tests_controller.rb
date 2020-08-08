class TestsController < ApplicationController
  def index
    tests = Test.all
    render json: tests
  end

  def show
    test = Test.find_by_id(params[:id])
    render json: test
  end

  def update
    test = Test.find_by_id(params[:id])
    if test.update(test_params)
      render json: test
    else
      render json: test.errors
    end
  end

  private

    def test_params
      params.require(:test).permit(:id,:title,:author,:content,:likes)
    end
end
