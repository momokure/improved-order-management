class DomesticBuying::WipController < ApplicationController
  def index
    @orders = Order.includes(:buy_details)
                .where.not(buy_details: { buy_progress_id: 2 })
                .where.not(orders: { internal_delivery_date: nil })
                .order(:internal_delivery_date)
  end
end