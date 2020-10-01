class Accounting::InvoicingController < ApplicationController
  require "date"

  def index
    deficiency = [-Float::INFINITY..-1]
    @orders = Order.where(difference: deficiency).distinct
                .where(payment_method_id: 3)
                .order(Arel.sql('customer_id DESC'))
                .order(Arel.sql('internal_delivery_date IS NULL, internal_delivery_date ASC'))
                .or(Order.where(payment_amount: nil).distinct
                    .where(payment_method_id: 3)
                    .order(Arel.sql('customer_id DESC'))
                    .order(Arel.sql('internal_delivery_date IS NULL, internal_delivery_date ASC')))
                .or(Order.where(internal_delivery_date: nil).distinct
                      .where(payment_method_id: 3)
                      .order(Arel.sql('customer_id DESC'))
                      .order(Arel.sql('internal_delivery_date IS NULL, internal_delivery_date ASC')))
  end
end