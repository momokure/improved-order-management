class Representative::TodayController < ApplicationController
  def index
    @orders = Order.all
    @from = DateTime.now.beginning_of_day - 9.hour
    @to = @from+1
  end
end