class Representative::ReportController < ApplicationController
  require 'date'

  def index
    @year_month = params[:year_month]
    @year_month_beginning = @year_month.to_s+"-01"
    @year_month_beginning = @year_month_beginning.to_date
    @end = @year_month_beginning.next_month-1

    @mizukami_number_all = Order.where(representative_user_id: 6).distinct
                         .where(order_type_id: [1, 2]).distinct
                         .count

    @mizukami_number_day = Order.where(representative_user_id: 6).distinct
                         .where(order_type_id: [1, 2]).distinct
                         .group(:first_response_date)
                         .count
  end
end