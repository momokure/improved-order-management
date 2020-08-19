class Bijogi::AllController < ApplicationController
  def index
    @orders = Order.left_joins(:order_details)
                .where(order_details: { factory_id: 8 })
  end
end