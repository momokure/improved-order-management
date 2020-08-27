class OverseasBuying::BacklogController < ApplicationController
  def index
    @orders = Order.left_joins(:buy_details).distinct
                .where(orders: { overseas_buying: 1 }).distinct
                .where(buy_details: { order_id: nil }).distinct
                .where.not(orders: { internal_delivery_date: nil }).distinct
                .order(:internal_delivery_date)
                .or(
                  Order.left_joins(:buy_details).distinct
                    .where(orders: { overseas_buying: 1 }).distinct
                    .where.not(buy_details: { order_id: nil }).distinct
                    .where(buy_details: { buying_user_id: [29, 32, 33] }).distinct
                    .order(:internal_delivery_date)
                )
  end
end