class BalanceController < ApplicationController
  def new
    @cost = Cost.new
  end

  def create
    @cost = current_user.costs.new(cost_params)

    respond_to do |format|
      if @cost.save
        format.html { redirect_to costs_url, notice: 'Balance was successfully added!' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end
end
