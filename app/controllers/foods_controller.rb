class FoodsController < ApplicationController
  def index
  	@foods = Food.all
  	if params[:user_id]
  		@user_food = Food.where(user_id: params[:user_id])
  	end
  end

  def new
  	if params[:user_id]
  	   @food = Food.new
  	end
  end

  def create
  	if params[:user_id]
  		@food = Food.create food_params
  	end
  end

  def show
  	if params[:user_id]
  		@food = Food.where(user_id: params[:user_id]).where(id: params[:id])
  	end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  	def food_params
  		params.require(:food).permit(:name, :gluten_free, :vegan, :image_url)
    end

end
