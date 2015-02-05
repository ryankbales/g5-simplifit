class WorkoutCategoriesController < ApplicationController
	def new
		@workout_categories = WorkoutCategory.all
		@workout_category = WorkoutCategory.new
	end

	def create
    @workout_category = WorkoutCategory.new(workout_category_params)
    if @workout_category.save
      flash[:notice] = "The workout category has been created."
      redirect_to new_workout_category_path
    else
      render :new
    end
  end

	def show
	end

	def workout_category_params
    params.require(:workout_category).permit(:category)
  end
end