class TestsController < ApplicationController
  before_action :set_test, only: [:show, :update, :destroy]

  def index
    tests = Test.all

    render json: tests
  end

  def show
    render json: test
  end

  def create
    test = Test.new(test_params)

    if test.save
      render json: test#, status: :created, location: test
    else
      render json: test.errors#, status: :unprocessable_entity
    end
  end

  # def update
  #   if test.update(test_params)
  #     render json: test
  #   else
  #     render json: test.errors#, status: :unprocessable_entity
  #   end
  # end

  # def destroy
  #   test.destroy
  # end

  private
    def set_test
      test = Test.find_by_id(params[:id])
    end

    def test_params
      params.require(:test).permit(:name, :content)
    end
end
