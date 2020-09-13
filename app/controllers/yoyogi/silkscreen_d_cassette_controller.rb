class Yoyogi::SilkscreenDCassetteController < ApplicationController
  def index
    @date = params[:date]
    @orders = Order.left_joins(order_details: :order_technique_detail_options).distinct
                .where(order_technique_detail_options: { technique_option_id: 5 }).distinct
                .where(orders: { internal_delivery_date: @date.to_date }).distinct
                .order(:internal_delivery_date)
  end
end