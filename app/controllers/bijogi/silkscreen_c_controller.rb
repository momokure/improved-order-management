class Bijogi::SilkscreenCController < ApplicationController
  def index
    @orders = Order.left_joins(order_details: :order_technique_details)
                .where(order_details: { factory_id: 8 })
                .where(order_technique_details: { technique_id: 3 })
                .order(:internal_delivery_date)
  end
end