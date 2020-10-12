class Representative::PaymentOnlyController < ApplicationController
  def index
    @orders = Order.where(orders: { order_type: 9 })
  end
end