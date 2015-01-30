class SimplifitUsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update]
  before_action :require_same_user, only: [:edit, :update]
	def new
    @user = SimplifitUser.new
  end

  def show

  end

  def create
    @user = SimplifitUser.new(user_params)
    if @user.save
      flash[:notice] = "You are registered!"
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Your Profile Was Updated"
      redirect_to user_path
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :age, :gender, :department_id, :timezone)
  end

  private

  def set_user
    @user = SimplifitUser.find(params[:id])
  end

  # def require_same_user
  #   if current_user != @user
  #     flash[:error] = "This ain't your deal dude!"
  #     redirect_to root_path
  #   end
  # end
end