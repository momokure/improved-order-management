class Bijogi::AllController < ApplicationController
  def index
    @orders = Order.left_joins(:order_details).distinct
                .where(order_details: { factory_id: 8 }).distinct
                .order(:internal_delivery_date)
  end
end