class WorkoutsController < ApplicationController
  before_action :current_app_user, only: [:new, :create, :edit, :update]
	def new
		@workout = Workout.new
	end

	def create
    @workout = Workout.new(workout_params)
    if @workout.save
      flash[:notice] = "Your workout has been recorded.  Nice work!"
      redirect_to simplifit_user_path(@workout.simplifit_user)
    else
      flash[:error] = "You forgot to enter some info about your workout."
    end
  end

	def edit
	end

  def update
  end

	def workout_params
    params.require(:workout).permit(:workout_category_id, :duration, :created_at)
  end
end