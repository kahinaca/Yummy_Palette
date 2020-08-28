class RestaurantsController < ApplicationController
  def show
      @restaurant = Restaurant.find(params[:id])
      @dish = Dish.new
      @review = Review.new
      @cuisine = @restaurant.cuisine
  end

  def create
    @restaurant = restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render 'new'
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone, :vegan, :vegetarian, :latitude, :longitude, :photo)
  end
end
