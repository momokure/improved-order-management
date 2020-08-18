class Representative::TodayController < ApplicationController
  def index
    @orders = Order.all
    @from = Date.today
    @to = @from+1
  end
end