class Bijogi::EmbroideryController < ApplicationController
  def index
    @orders = Order.left_joins(order_details: :order_technique_details).distinct
                .where(order_details: { factory_id: 8 }).distinct
                .where(order_technique_details: { technique_id: 5 }).distinct
                .order(:internal_delivery_date)
  end

  def wip
    @date = params[:date]
    @orders = Order.left_joins(order_details: :order_technique_details).distinct
                .where(order_details: { factory_id: 8 }).distinct
                .where(order_technique_details: { technique_id: 5 }).distinct
                .where.not(order_technique_details: { progress_id: 7 })
                .where(orders: { internal_delivery_date: @date.to_date }).distinct
                .order(:internal_delivery_date)
  end

  def done
    @date = params[:date]
    @orders = Order.left_joins(order_details: :order_technique_details).distinct
                .where(order_details: { factory_id: 8 }).distinct
                .where(order_technique_details: { technique_id: 5 }).distinct
                .where(order_technique_details: { progress_id: 7 })
                .where(orders: { internal_delivery_date: @date.to_date }).distinct
                .order(:internal_delivery_date)
  end

  def pasteup_wip
    @date = params[:date]
    @orders = Order.left_joins(order_details: :order_technique_details).distinct
                .where(order_details: { factory_id: 8 }).distinct
                .where(order_technique_details: { technique_id: 5 }).distinct
                .where.not(order_technique_details: { progress_id: [4, 5, 6, 7] })
                .where(orders: { internal_delivery_date: @date.to_date }).distinct
                .order(:internal_delivery_date)
  end

  def pasteup_done
    @date = params[:date]
    @orders = Order.left_joins(order_details: :order_technique_details).distinct
                .where(order_details: { factory_id: 8 }).distinct
                .where(order_technique_details: { technique_id: 5 }).distinct
                .where(order_technique_details: { progress_id: [4, 5, 6, 7] })
                .where(orders: { internal_delivery_date: @date.to_date }).distinct
                .order(:internal_delivery_date)
  end

  def report
    @year_month = params[:year_month]
    @year_month_beginning = @year_month.to_s+"-01"
    @year_month_beginning = @year_month_beginning.to_date
    @end = @year_month_beginning.next_month-1
    @month = @year_month_beginning.month

    @period = (Date.parse("#{@year_month_beginning}")..Date.parse("#{@end}"))

    @orders = Order.left_joins(order_details: :order_technique_details).distinct
                .where(order_details: { factory_id: 8 }).distinct
                .where(order_technique_details: { technique_id: 5 }).distinct
                .where(order_type_id: [1, 2]).distinct
                .where.not(first_response_date: nil).distinct
                .group(:first_response_date)
                .count

    @complaint = Order.left_joins(order_details: :order_technique_details).distinct
                   .where(order_details: { factory_id: 8 }).distinct
                   .where(order_technique_details: { technique_id: 5 }).distinct
                   .where(order_type_id: [3]).distinct
                   .group(:order_date)
                   .count
  end
end