class DomesticBuying::BacklogBlankController < ApplicationController
def index
    @orders = Order.left_joins(:buy_details).distinct
                .where(orders: { domestic_buying: 1 }).distinct
                .where(buy_details: { order_id: nil }).distinct
                .where(orders: { internal_delivery_date: nil }).distinct
                .order(:order_date)
  end
end