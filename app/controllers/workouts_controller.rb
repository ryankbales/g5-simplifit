class WorkoutsController < ApplicationController
	def new
		@workout = Workout.new
	end

	def create
    @workout = Workout.new(workout_params)
    if @workout.save
      flash[:notice] = "Your workout has been recorded.  Nice work!"
      redirect_to :back
    else
      render simplifit_user_path(@user)
    end
  end

	def edit
	end

	def workout_params
     binding.pry
    params.require(:workout).permit(:workout_category_id, :duration)
  end
end