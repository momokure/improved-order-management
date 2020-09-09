class DomesticBuying::BacklogPaymentDateController < ApplicationController
  def index
    @orders = Order.left_joins(:payments, :buy_details).distinct
                .where.not(payments: { order_id: nil }).distinct
                .where(orders: { domestic_buying: 1 }).distinct
                .where.not(orders: { internal_delivery_date: nil }).distinct
                .where(buy_details: { order_id: nil }).distinct
                .order(Arel.sql('payments.payment_date'))
                .order(Arel.sql('internal_delivery_date IS NULL, internal_delivery_date ASC'))
                .order(:order_type_id)
                .order(:desired_delivery_type_id)
                .or(
                  Order.left_joins(:payments, :buy_details).distinct
                    .where.not(payments: { order_id: nil }).distinct
                    .where(orders: { domestic_buying: 1 }).distinct
                    .where(buy_details: { buy_type_id: 1 }).distinct
                    .where.not(buy_details: { buy_progress_id: 2 }).distinct
                    .order(Arel.sql('payments.payment_date'))
                    .order(Arel.sql('internal_delivery_date IS NULL, internal_delivery_date ASC'))
                    .order(:order_type_id)
                    .order(:desired_delivery_type_id)
                )
                .or(
                  Order.left_joins(:payments, :buy_details).distinct
                    .where(orders: { domestic_buying: 1 }).distinct #国内発注あり
                    .where(orders: { overseas_buying: 1 }).distinct #海外発注あり
                    .order(Arel.sql('payments.payment_date'))
                    .order(Arel.sql('internal_delivery_date IS NULL, internal_delivery_date ASC'))
                    .order(:order_type_id)
                    .order(:desired_delivery_type_id)
                )
  end
end