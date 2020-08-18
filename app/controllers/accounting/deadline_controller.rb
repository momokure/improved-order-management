class Accounting::DeadlineController < ApplicationController
  require "date"
  def index
    @orders = Order.left_joins(:payments).where(payments: { order_id: nil })
                .where.not(orders: { payment_deadline_date: nil })
                .order(:payment_deadline_date)
  end
end