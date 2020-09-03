class OverseasBuying::AllController < ApplicationController
  def index
    @orders = Order.left_joins(:buy_details).distinct
                .where(orders: { overseas_buying: 1 }).distinct
                .where(buy_details: { order_id: nil }).distinct
                .where.not(orders: { internal_delivery_date: nil }).distinct
                .order(:internal_delivery_date)
                .order(:desired_delivery_type_id)
                .order(:order_type_id)
                .or(
                  Order.left_joins(:buy_details).distinct
                    .where(orders: { overseas_buying: 1 }).distinct
                    .where.not(buy_details: { order_id: nil }).distinct
                    .order(:internal_delivery_date)
                    .order(:desired_delivery_type_id)
                    .order(:order_type_id)
                )
  end
end