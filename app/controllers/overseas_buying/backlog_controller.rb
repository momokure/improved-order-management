class OverseasBuying::BacklogController < ApplicationController
  def index
    @orders = Order.left_joins(:buy_details)
                .where(buy_details: { order_id: nil })
                .where(orders: { overseas_buying: 1 })
                # .where.not(buy_details: { buy_progress_id: [2] })
  end
end