class OrderManagement::UndefinedDateController < ApplicationController
  require "date"
  def index
    @orders = Order.left_joins(:payments)
                .where(orders: { internal_delivery_date: nil })
                .where.not(payments: { order_id: nil })
                .order(:payment_date).distinct
  end
end