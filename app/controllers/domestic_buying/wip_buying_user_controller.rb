class DomesticBuying::WipBuyingUserController < ApplicationController
  def index
    @orders = Order.left_joins(:buy_details, :order_details).distinct
                    .where(orders: { domestic_buying: 1 }).distinct
                    .where(buy_details: { buy_type_id: 1 }).distinct
                    .where.not(buy_details: { buy_progress_id: 2 }).distinct
                    .order(Arel.sql('buy_details.buying_user_id'))
                    .order(Arel.sql('buy_details.buy_progress_id'))
                    .order(:internal_delivery_date)
                    .order(:order_type_id)
  end
end