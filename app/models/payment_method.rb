class PaymentMethod < ApplicationRecord
  enum invoice_required: { not_required: false, required: true }
  has_many :users
  has_many :orders
end
