class OrderManagement::ChangeDeliveryDateController < ApplicationController
  require "date"
  def index
    @orders = Order.where(change_delivery_date: 1).distinct
  end
end

