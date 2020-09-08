class DomesticBuying::BacklogBlankController < ApplicationController
  def index
    @orders = Order.left_joins(:buy_details, :order_details, :payments).distinct
                .where(orders: { domestic_buying: 1 }).distinct
                .where(orders: { internal_delivery_date: nil }).distinct
                .where(buy_details: { order_id: nil }).distinct
                .order(Arel.sql('payments.payment_date IS NULL, payments.payment_date ASC'))
                .order(Arel.sql('order_details.factory_id IS NULL, order_details.factory_id ASC'))
                .or(
                  Order.left_joins(:buy_details, :order_details, :payments).distinct
                    .where(orders: { domestic_buying: 1 }).distinct
                    .where(orders: { internal_delivery_date: nil }).distinct
                    .where(buy_details: { buy_type_id: 1 }).distinct
                    .where.not(buy_details: { buy_progress_id: 2 }).distinct
                    .order(Arel.sql('payments.payment_date IS NULL, payments.payment_date ASC'))
                    .order(Arel.sql('order_details.factory_id IS NULL, order_details.factory_id ASC'))
                )
                .or(
                  Order.left_joins(:buy_details, :order_details, :payments).distinct
                    .where(orders: { domestic_buying: 1 }).distinct #国内発注あり
                    .where(orders: { overseas_buying: 1 }).distinct #海外発注あり
                    .order(Arel.sql('payments.payment_date IS NULL, payments.payment_date ASC'))
                    .order(Arel.sql('order_details.factory_id IS NULL, order_details.factory_id ASC'))
                )
  end
end