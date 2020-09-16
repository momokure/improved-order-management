class Accounting::AllController < ApplicationController
  require "date"
  def index
    @orders = Order.includes(:representative_user, :order_addresses, :payments, :buy_details, :order_notes)
                .order(order_date: "DESC")
  end
end