class DomesticBuying::BacklogAllController < ApplicationController
  def index
    @orders = Order.left_joins(:buy_details).distinct
                .where(orders: { domestic_buying: 1 }).distinct
                .where(buy_details: { order_id: nil }).distinct
                .where.not(orders: { internal_delivery_date: nil }).distinct
                .order(:internal_delivery_date)
                .or(
                  Order.left_joins(:buy_details).distinct
                    .where(orders: { domestic_buying: 1 }).distinct
                    .where.not(buy_details: { order_id: nil }).distinct
                    .where(buy_details: { buying_user_id: 54 }).distinct
                    .order(:internal_delivery_date)
                )
                # .order(:internal_delivery_date)
  end
end