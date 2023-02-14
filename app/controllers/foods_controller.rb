class FoodsController < ApplicationController
  def index
    @food = Food.all
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(
      name: food_params[:name],
      measurement_unit: food_params[:measurement_unit],
      price: food_params[:price],
      quantity: food_params[:quantity],
      user_id: current_user.id
    )

    if @food.save
      redirect_to foods_path
    else
      render :new, alert: ':( Cannot Create food retry again :('
    end
  end

  def destroy
    @food = Food.find(params[:id])

    redirect_to foods_path

    if @food.destroy
      flash[:success] = 'Food deleted'
    else
      flash.now[:error] = 'Food Not Deleted'
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
