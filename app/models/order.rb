class Order < ApplicationRecord
  enum domestic_buying: { not_included: 0, included: 1 }, _suffix: true
  enum overseas_buying: { not_included: 0, included: 1 }, _suffix: true
  enum carry_in: { not_included: 0, included: 1 }, _suffix: true
  enum payment_confirmation: {unconfirmed: 0, confirmed: 1}, _suffix: true
  enum send_receipt: {unconfirmed: 0, confirmed: 1}, _suffix: true

  enum send_receipt: { unsent: 0, sent: 1 }, _suffix: true
  enum send_invoice: { unsent: 0, sent: 1 }, _suffix: true

  belongs_to :customer
  belongs_to :order_reflect_user, class_name: "User"
  belongs_to :csr_user, class_name: "User"
  belongs_to :shipment_user, class_name: "User"
  belongs_to :order_type
  belongs_to :quote_difficulty_level
  belongs_to :payment_method
  belongs_to :specified_time
end
