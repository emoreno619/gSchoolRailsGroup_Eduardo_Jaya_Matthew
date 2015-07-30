class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :confirm_admin, only: [:index, :edit, :update, :desrtroy]

  def index
  	@users = User.all
  end

  def create
    @user = User.create user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to locations_path
    else
      render :signup
    end
  end

  def show
  	@user = User.find_by_id(params[:id])
  end

  def edit
  	@user = User.find_by_id(params[:id])
  end

  def update
  	@user = User.find_by_id(params[:id])
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

    def set_user
      @user = User.find params[:id]
    end

    def ensure_correct_user
    # compare some params vs something in the session/current_user
    unless params[:id].to_i == session[:user_id]
      redirect_to all_teams_path, alert: "Not Authorized"
    end
  end
end
