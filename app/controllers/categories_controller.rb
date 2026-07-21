class CategoriesController < ApplicationController
  def index
    @categories = Current.user.categories.order(:name)
  end

  def new
    @category = Current.user.categories.new
  end

  def create
    @category = Current.user.categories.new(category_params)

    if @category.save
      redirect_to categories_path,
                  notice: "Category was added successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
