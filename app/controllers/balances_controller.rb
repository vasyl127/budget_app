class BalancesController < ApplicationController
  def new
    @cost = Cost.new
  end

  def create
    @category = current_user.categories.find_by(name: 'up balance')
    @cost = @category.costs.new(balance_params)

    respond_to do |format|
      if @cost.save
        format.html { redirect_to costs_url, notice: 'Balance was successfully added!' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def balance_params
    params.permit(:name, :value)
          .merge(user_id: current_user.id, currency: ::ExchangeRate::Base.new.return_last.id)
  end
end
