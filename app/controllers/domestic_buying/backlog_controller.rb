class DomesticBuying::BacklogController < ApplicationController
  def index
    # @orders = Order.left_joins(order_details: :buy_details)
    #             .where(buy_details: { order_detail_id: nil })
    #             .or(Order.left_joins(order_details: :buy_details)
    #                   .where.not(buy_details: { buy_progress_id: 1 })
    #             )

    @orders = Order.left_joins(order_details: :buy_details)
                      .where(buy_details: { buy_progress_id: [2, 3, 4] })

    # @orders = Order.left_joins(:order_details).where(payments: { order_id: nil })
    #             .where.not(orders: { internal_delivery_date: nil })
    #             .order(:internal_delivery_date)
  end
end