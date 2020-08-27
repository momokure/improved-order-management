class DomesticBuying::WipController < ApplicationController
  def index
    @orders = Order.left_joins(:buy_details)
                .where.not(buy_details: { buy_progress_id: 2 }).distinct
                .order(:internal_delivery_date)
  end
end