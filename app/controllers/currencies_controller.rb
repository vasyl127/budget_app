# frozen_string_literal: true

class CurrenciesController < ApplicationController
  def index
    @last = ::ExchangeRate::Base.new.return_last
    @currencies = Currency.all
  end
end
