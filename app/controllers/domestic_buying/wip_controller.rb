class DomesticBuying::WipController < ApplicationController
  def index
    @orders = Order.left_joins(:buy_details)
                .where.not(buy_details: { buy_progress_id: 2 }).distinct
                .where.not(orders: { internal_delivery_date: nil }).distinct
                .order(:internal_delivery_date)

    @orders = Order.left_joins(:buy_details).distinct
                .where(orders: { domestic_buying: 1 }).distinct
                .where.not(buy_details: { buying_user: 54 }).distinct
                .order(:internal_delivery_date)
  end
end