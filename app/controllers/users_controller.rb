class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def create
	if @user.save
		redirect_to users_path
	else
		render :new
	end  	
  end

  def show
  end

  def edit
  end

  def update
  	
  end

  def destroy
  end
end
