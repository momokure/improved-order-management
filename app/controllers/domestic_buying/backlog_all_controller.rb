class DomesticBuying::BacklogAllController < ApplicationController
  def index
    @orders = Order.left_joins(:buy_details).distinct
                .where(orders: { domestic_buying: 1 }).distinct
                .where(buy_details: { order_id: nil }).distinct
                .where.not(orders: { internal_delivery_date: nil }).distinct
                .order(:internal_delivery_date)
                .or(
                  Order.left_joins(:buy_details).distinct
                    .where(orders: { domestic_buying: 1 }).distinct
                    .where.not(buy_details: { order_id: nil }).distinct
                    .where(buy_details: { buying_user_id: 54 }).distinct
                    .order(:internal_delivery_date)
                )
                .or(
                  Order.left_joins(:buy_details).distinct
                    .where(orders: { domestic_buying: 1 }).distinct
                    .where.not(buy_details: { buying_user_id: [29, 32, 33] }).distinct
                    .order(:internal_delivery_date)
                )
                # .order(:internal_delivery_date)
  end
end

   # .where(buy_details: { buying_user_id: nil }).distinct
   # .where.not(buy_details: { buying_user_id: [29, 32, 33] }).distinct

# 国内発注ありで
# 発注詳細が未制作で
# 社内納期がある
#
# または
# 国内発注ありで
# 海外発注済 (=担当者が奥田さん) がありだけど
   # 国内未発注 (=担当者が藤田さん、井上さん、小田さんがいない)