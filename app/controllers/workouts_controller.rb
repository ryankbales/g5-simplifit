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
      render :new
    end
  end

	def edit
	end

	def workout_params
    params.require(:workout).permit(:type_id, :duration)
  end
end