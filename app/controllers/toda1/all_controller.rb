class Toda1::AllController < ApplicationController
  def index
    @orders = Order.left_joins(:order_details).distinct
                .where(order_details: { factory_id: 4 }).distinct
                .order(:internal_delivery_date)
  end
end