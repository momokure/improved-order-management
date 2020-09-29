class Accounting::ForRepresentativeController < ApplicationController
  require "date"

  def index
    @orders = Order.left_joins(:payments).distinct
                .where.not(orders: { difference: 0 }).distinct
                .order(Arel.sql('internal_delivery_date IS NULL, internal_delivery_date ASC'))
                .order(Arel.sql('difference ASC'))
                .order(Arel.sql('payment_deadline_date IS NULL, payment_deadline_date ASC'))
  end
end