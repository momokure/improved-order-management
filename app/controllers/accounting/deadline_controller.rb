class Accounting::DeadlineController < ApplicationController
  require "date"
  def index
    @orders = Order.left_joins(:payments).where(payments: { order_id: nil })
                .order(:payment_deadline_date)
  end
end