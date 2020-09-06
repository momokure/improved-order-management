class Bijogi::SortingController < ApplicationController
  def backlog
    @orders = Order.left_joins(order_details: :sort_details).distinct
                .where(order_details: { factory_id: 8 }).distinct
                .where(sort_details: { order_detail_id: nil }).distinct
                .order(Arel.sql('internal_delivery_date IS NULL, internal_delivery_date ASC'))
                .order(:desired_delivery_type_id)
                .order(:order_type_id)
  end

  def done

  end
end