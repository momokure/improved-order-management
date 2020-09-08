class Pasteup::WipController < ApplicationController
  require 'date'
  PER = 500

  def index
    @date = params[:date]
    @start = Date.today.prev_occurring(:sunday)
    @end = @start.next_month.next_month.end_of_week

    @orders = Order.left_joins(order_details: :order_technique_details).distinct
                .where.not(order_technique_details: { progress_id: [1,2] })
                .where(orders: { internal_delivery_date: @date.to_date }).distinct
                .order(:internal_delivery_date)
  end

end
