class TestsController < ApplicationController
  # before_action :set_test, only: [:show]

  def index
    tests = Test.all
    options = {
      include: [:scores]
    }
    render json: TestSerializer.new(tests, options)
  end

  def show
    options = {
      include: [:scores]
    }
    test = Test.find_by_id(params[:id])
    render json: TestSerializer.new(test, options)
  end
  

  def create
    test = Test.new(test_params)
    options = {
      include: [:scores]
    }
    if test.save
      render json: TestSerializer.new(test, options) #status: :created, location: test
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
    # def set_test
    #   test = Test.find_by_id(params[:id])
    # end

    def test_params
      params.require(:test).permit(:name, :content)
    end
end
