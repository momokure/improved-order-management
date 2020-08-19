class Representative::BacklogController < ApplicationController
  def index
    @orders = Order.where(representative_user_id: 1, first_response_date: nil)
    @from = DateTime.now.beginning_of_day - 9.hour
    @to = @from+1
  end

  def update
    redirect_to edit_order_path
  end
end