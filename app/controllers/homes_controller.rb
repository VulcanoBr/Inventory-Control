class HomesController < ApplicationController
  
  def index
    @stocks = Stock.with_minimum_quantity
  end
end
