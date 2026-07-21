class MonthlySalariesController < ApplicationController
  def index
    @monthly_salaries = Current.user.monthly_salaries.order(month: :desc)
  end

  def new
    @monthly_salary = Current.user.monthly_salaries.new
  end

  def create
    @monthly_salary = Current.user.monthly_salaries.new(monthly_salary_params)

    if @monthly_salary.save
      redirect_to monthly_salaries_path, notice: "Monthly salary was added successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @monthly_salary = Current.user.monthly_salaries.find(params[:id])
  end

  def update
    @monthly_salary = Current.user.monthly_salaries.find(params[:id])

    if @monthly_salary.update(monthly_salary_params)
      redirect_to monthly_salaries_path,
                  notice: "Monthly salary was updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private

  def monthly_salary_params
    params.require(:monthly_salary).permit(:month, :amount)
  end
end
