class Accounting::BacklogController < ApplicationController
  def index
    payment = Order.eager_load(:payments)
    @orders = Order.where(payment.nil?)
  end

  def update

  end
end