class CategoriesController < ApplicationController
  before_action :category_by_id, only: %i[ show edit update destroy ]
  before_action :all_categories, only: %i[ index show ]


  def index

  end

  def show

    @costs = @category.costs
  end

  def new
    @category = Category.new
  end

  def edit; end

  def create
    @category = current_user.categories.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_url, notice: 'Category was successfully created!.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit

  end

  def update

    @category.update(category_params)

    redirect_to categories_path(@category), notice: 'Category was successfully updated!.'
  end

  def destroy

    @category.destroy

    redirect_to categories_url, notice: 'Category was successfully deleted!'
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def category_by_id
    @category = Category.find(params[:id])
  end

  def all_categories
    @categories = current_user.categories
  end
end
