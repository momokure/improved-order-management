class Accounting::ForRepresentativeController < ApplicationController
  require "date"
  def index
    @orders = Order.left_joins(:payments).distinct
                .where(orders: { order_type_id: 1 }).distinct
                .order(order_date: "DESC")
  end

  # def index
  #   @orders = Order.left_joins(:buy_details, :order_details).distinct
  #               .where(orders: { domestic_buying: 1 }).distinct #国内発注あり
  #               .where.not(orders: { internal_delivery_date: nil }).distinct #納品日空欄
  #               .where(buy_details: { order_id: nil }).distinct #発注部署記載なし
  #               .order(Arel.sql('internal_delivery_date IS NULL, internal_delivery_date ASC'))
  #               .order(Arel.sql('order_details.factory_id'))
  #               .order(:order_type_id)
  #               .or(
  #                 Order.left_joins(:buy_details, :order_details).distinct
  #                   .where(orders: { domestic_buying: 1 }).distinct #国内発注あり
  #                   .where(buy_details: { buy_type_id: 1 }).distinct #国内発注部署記載あり
  #                   .where.not(buy_details: { buy_progress_id: 2 }).distinct #国内発注部署記載あり(発注完了以外)
  #                   .order(Arel.sql('internal_delivery_date IS NULL, internal_delivery_date ASC'))
  #                   .order(Arel.sql('order_details.factory_id'))
  #                   .order(:order_type_id)
  #               )
  #               .or(
  #                 Order.left_joins(:buy_details, :order_details).distinct
  #                   .where(orders: { domestic_buying: 1 }).distinct #国内発注あり
  #                   .where(orders: { overseas_buying: 1 }).distinct #海外発注あり
  #                   .order(Arel.sql('internal_delivery_date IS NULL, internal_delivery_date ASC'))
  #                   .order(Arel.sql('order_details.factory_id'))
  #                   .order(:order_type_id)
  #               )
  # end
end