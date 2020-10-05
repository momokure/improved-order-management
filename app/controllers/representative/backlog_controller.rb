class Representative::BacklogController < ApplicationController
  def index
    @orders = Order.where(representative_user_id: 1, first_response_date: nil)
                .where(order_type_id: [1, 2])
                .order(:order_date)
                .order(:internal_delivery_date)

    @priority_orders = Order.where(representative_user_id: 1, first_response_date: nil)
                         .where.not(order_type_id: [1, 2])
                         .order(:order_date)
                         .order(:internal_delivery_date)

    @from = DateTime.now.beginning_of_day - 9.hour
    @to = @from+1

    @year = Date.today.year
    @this_month = Date.today.month
    @last_month = Date.today.month-1
    @this_month = @year.to_s + "-0" + @this_month.to_s
    @last_month = @year.to_s + "-0" + @last_month.to_s
  end

  def update
    redirect_to edit_order_path
  end
end