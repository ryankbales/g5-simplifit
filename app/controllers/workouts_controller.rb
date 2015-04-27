class WorkoutsController < ApplicationController
  before_action :require_simplifit_user, only: [:new, :create, :edit, :update]
  before_action :set_user, only: [:new]

	def new
		
	end

	def create
    @workout = Workout.new(workout_params)
    @workout.simplifit_user_id = params[:simplifit_user_id]
    if @workout.save
      flash[:success] = "Your workout has been recorded.  Nice work!"
    else
      flash[:error] = "You forgot to enter some info about your workout."
    end
    redirect_to simplifit_user_path(@workout.simplifit_user)
  end

	def edit
	end

  def update
  end

	def workout_params
    params.require(:workout).permit(:workout_category_id, :duration, :simplifit_user_id)
  end

  def set_user
    @simplifit_user = SimplifitUser.find(params[:id])
  end
end