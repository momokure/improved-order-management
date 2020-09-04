class DomesticBuying::BacklogAllController < ApplicationController
  def index
    @orders = Order.left_joins(:buy_details, :order_details).distinct
                .where(orders: { domestic_buying: 1 }).distinct
                .where.not(orders: { internal_delivery_date: nil }).distinct
                .where(buy_details: { order_id: nil }).distinct
                .order(Arel.sql('internal_delivery_date IS NULL, internal_delivery_date ASC'))
                .order(Arel.sql('order_details.factory_id'))
                .order(:order_type_id)
                .or(
                  Order.left_joins(:buy_details, :order_details).distinct
                    .where(orders: { domestic_buying: 1 }).distinct
                    .where(buy_details: { buy_type_id: 1 }).distinct
                    .where.not(buy_details: { buy_progress_id: 2 }).distinct
                    .order(Arel.sql('internal_delivery_date IS NULL, internal_delivery_date ASC'))
                    .order(Arel.sql('order_details.factory_id'))
                    .order(:order_type_id)
                )
  end
end