class Yoyogi::AllController < ApplicationController
  def index
    @date = params[:date]
    @orders = Order.left_joins(order_details: :order_technique_details).distinct
                .where(order_details: { factory_id: 7 }).distinct
                .where(orders: { internal_delivery_date: @date.to_date }).distinct
                .order(:internal_delivery_date)
  end

  def wip
    @date = params[:date]
    @orders = Order.left_joins(order_details: :order_technique_details).distinct
                .where(order_details: { factory_id: 7 }).distinct
                .where.not(order_technique_details: { progress_id: 7 }).distinct
                .where(orders: { internal_delivery_date: @date.to_date }).distinct
                .order(:internal_delivery_date)
  end

  def done
    @date = params[:date]
    @orders = Order.left_joins(order_details: :order_technique_details).distinct
                .where(order_details: { factory_id: 7 }).distinct
                .where(order_technique_details: { progress_id: 7 }).distinct
                .where(orders: { internal_delivery_date: @date.to_date }).distinct
                .order(:internal_delivery_date)
  end
end