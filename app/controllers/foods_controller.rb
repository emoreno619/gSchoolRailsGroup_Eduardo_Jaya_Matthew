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
  		if @food.save
  			redirect_to user_foods_path(:user_id), flash:{success:'Food successfully created!'}
  		else
  			render :new
  		end
  	end
  end

  def show
  	if params[:user_id]
  		@food = Food.where(id: params[:id])[0]
  	end
  end

  def edit
  	if params[:user_id]
  		@food = Food.where(id: params[:id])[0]
  	end
  end

  def update
  	if params[:user_id]
  	  	if @food.update
  			redirect_to user_foods_path(:user_id), flash:{success:'Food successfully updated!'}
  		else
  			render :edit
  		end
  	end
  end

  def destroy

  end

  private
  	def food_params
  		params.require(:food).permit(:name, :gluten_free, :vegan, :image_url)
    end

end
