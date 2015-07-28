class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
	if @user.save
		redirect_to users_path
	else
		render :new
	end  	
  end

  def show
  	@user = User.find_by_id(params[:id])
  end

  def edit
  	@user = User.find_by_id(params[:id])
  end

  def update
  	@user = User.new
  	@user.update_attributes(user_params)
  	if @user.save
  		redirect_to users_path
  	else
  		render :edit
  	end
  end

  def destroy
  	@user = User.find_by_id(params[:id])
  	@user.destroy
  	redirect_to users_path
  end

  private
  	def user_params
  		params.require(:user).permit(:email,:password)
  	end
end
