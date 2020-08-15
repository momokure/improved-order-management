class Accounting::BacklogController < ApplicationController
  require "date"
  def index
    @day = Date.today
    @orders = Order.left_joins(:payments).where(payments: { order_id: nil })
    @payment = Payment.new
  end
end