# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :category_by_id, only: %i[show edit update destroy]
  before_action :all_categories, only: %i[index show]

  def index; end

  def show
    @costs = @category.costs
  end

  def new
    @category = Category.new
  end

  def edit; end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        current_user.categories << @category
        format.html { redirect_to categories_url, notice: t('.success') }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    @category.update(category_params)

    redirect_to categories_path(@category), notice: t('.success')
  end

  def destroy
    @category.destroy

    redirect_to categories_url, notice: t('.success')
  end

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end

  def category_by_id
    @category = Category.find(params[:id])
  end

  def all_categories
    @categories = current_user.categories.order(updated_at: :desc)
  end
end
