class CostsController < ApplicationController
  before_action :cost_by_id, only: %i[ show edit update destroy ]
  before_action :all_costs, only: %i[ index show ]

  def index

  end

  def show

    # @costs = @cost.costs
  end

  def new
    @cost = Cost.new
  end

  def edit; end

  def create
    @category = Category.find(params['cost']['category_id'])
    @cost = @category.costs.new(cost_params)
    if @cost.value.positive?
      value = @cost.value * -1

      @cost.update(value: value)
    end

    respond_to do |format|
      if @cost.save
        format.html { redirect_to costs_url, notice: t('.success') }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @category = Category.find(params['category_id'])

  end

  def update
    @category = Category.find(params['cost']['category_id'])
    @cost.update(cost_params.merge(category_id: @category.id))

    redirect_to category_path(@category), notice: t('.success')
  end

  def destroy

    @cost.destroy

    redirect_to costs_url, notice: t('.success')
  end

  def all_costs
    @costs = Cost.joins(category: { user_categories: :user })
                 .where(users: { id: current_user.id })
                 .order(updated_at: :desc)
  end

  private

  def cost_params
    params.require(:cost).permit(:name, :value)
          .merge(user_id: current_user.id, currency: ::ExchangeRate::Base.new.return_last.id)
  end

  def cost_by_id
    @cost = Cost.find(params[:id])
  end
end
