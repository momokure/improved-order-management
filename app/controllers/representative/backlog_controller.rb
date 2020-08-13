class Representative::BacklogController < ApplicationController
  def index
    @orders = Order.where(representative_user_id: 1, first_response_date: nil)
  end
end