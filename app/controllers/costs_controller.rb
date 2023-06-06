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
    @cost = current_user.costs.new(cost_params)

    respond_to do |format|
      if @cost.save
        format.html { redirect_to costs_url, notice: 'Cost was successfully created!.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit

  end

  def update

    @cost.update(cost_params)

    redirect_to costs_path(@cost), notice: 'Cost was successfully updated!.'
  end

  def destroy

    @cost.destroy

    redirect_to costs_url, notice: 'Cost was successfully deleted!'
  end

  def all_costs
    @costs = current_user.costs.order(created_at: :desc)
  end

  private

  def cost_params
    params.require(:cost).permit(:name, :value)
  end

  def cost_by_id
    @cost = Cost.find(params[:id])
  end
end
