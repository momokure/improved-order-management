class OrderManagement::UndefinedFactoryController < ApplicationController
  require "date"
  def index
    @orders = Order.left_joins(:order_details)
                .where(order_details: { factory_id: 1 })
                .order(:internal_delivery_date)
  end
end