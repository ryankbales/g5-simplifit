class DepartmentsController < ApplicationController
  before_action :set_category, only: [:show, :update]

  def index
    @departments = Department.all
  end

  def show
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      flash[:notice] = "Department was successfully generated."
      redirect_to departments_path
    else
      render :new
    end
  end

  # def edit
  # end

  def update
    if @department.update(category_params)
      flash[:notice] = "Category was successfully updated."
      redirect_to departments_path
    else
      render :edit
    end
  end

  def department_params
    params.require(:department).permit(:name)
  end

  private

  def set_department
    @department = Department.find(params[:id])
  end

end