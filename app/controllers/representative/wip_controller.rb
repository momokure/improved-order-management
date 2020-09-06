class Representative::WipController < ApplicationController
  require 'date'

  def index
    @orders = Order.where(representative_user_id: current_user.id, payment_confirmation: "unconfirmed")

    @year = Date.today.year
    @this_month = Date.today.month
    @last_month = Date.today.month-1
    @this_month = @year.to_s + "-0" + @this_month.to_s
    @last_month = @year.to_s + "-0" + @last_month.to_s
  end
end