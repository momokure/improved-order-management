class Accounting::ForRepresentativeController < ApplicationController
  require "date"

  def index
    excess = [1..Float::INFINITY]
    deficiency = [-Float::INFINITY..-1]

    @excess_orders = Order.where(difference: excess).distinct
                .where(payment_method_id: [1, 2])
                .order(Arel.sql('difference DESC'))
                .order(Arel.sql('internal_delivery_date IS NULL, internal_delivery_date ASC'))
                .order(Arel.sql('payment_deadline_date IS NULL, payment_deadline_date ASC'))

    @deficiency_orders = Order.where(difference: deficiency).distinct
                           .where(payment_method_id: [1, 2])
                           .order(Arel.sql('internal_delivery_date IS NULL, internal_delivery_date ASC'))
                           .order(Arel.sql('payment_deadline_date IS NULL, payment_deadline_date ASC'))
  end
end