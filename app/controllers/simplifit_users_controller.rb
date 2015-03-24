class SimplifitUsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update]
  before_action :require_same_user, only: [:edit, :update]

  def index
    email = current_user.email
    if SimplifitUser.find_by_user_email(email)
      current_app_user = SimplifitUser.find_by_user_email(email)
      redirect_to simplifit_user_path(current_app_user)
    else
      flash[:notice] = "You're new here.  Create a profile."
      redirect_to new_simplifit_user_path
    end
  end

	def new
    @simplifit_user = SimplifitUser.new
    @oauth_user_email = current_user.email
  end

  def show
    @workout = Workout.new
    @workout_categories = WorkoutCategory.all
  end

  def create
    @simplifit_user = SimplifitUser.new(user_params)
    @simplifit_user.user_avatar = find_g5_image(@simplifit_user.first_name, @simplifit_user.last_name)
    if @simplifit_user.save
      flash[:notice] = "You are registered!"
      redirect_to simplifit_user_path(@simplifit_user)
    else
      flash[:notice] = "You forgot to fill out some required fields."
      render :new
    end
  end

  def edit
  end

  def update
    if @simplifit_user.update(user_params)
      flash[:notice] = "Your Profile Was Updated"
      redirect_to simplifit_user_path
    else
      render :new
    end
  end

  def user_params
    params.require(:simplifit_user).permit(:first_name, :last_name, :age, :user_email, :user_avatar, :gender, :department_id, :timezone)
  end

  private

  def set_user
    @simplifit_user = SimplifitUser.find(params[:id])
  end

  # def require_same_user
  #   if current_user != @user
  #     flash[:error] = "This ain't your deal dude!"
  #     redirect_to root_path
  #   end
  # end
end