class DomesticBuying::BacklogPaidController < ApplicationController
  def index
    @orders = Order.left_joins(:payments, :buy_details).distinct
                .where.not(payments: { order_id: nil }).distinct
                .where(orders: { domestic_buying: 1 }).distinct
                .where.not(orders: { internal_delivery_date: nil }).distinct
                .where(buy_details: { order_id: nil }).distinct
                .order(:internal_delivery_date)
                .order(:order_type_id)
                .order(:desired_delivery_type_id)
                .or(
                  Order.left_joins(:payments, :buy_details).distinct
                    .where.not(payments: { order_id: nil }).distinct
                    .where(orders: { domestic_buying: 1 }).distinct
                    .where(buy_details: { buy_type_id: 1 }).distinct
                    .where.not(buy_details: { buy_progress_id: 2 }).distinct
                    .order(:internal_delivery_date)
                    .order(:order_type_id)
                    .order(:desired_delivery_type_id)
                )
  end
end