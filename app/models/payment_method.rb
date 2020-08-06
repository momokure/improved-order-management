class PaymentMethod < ApplicationRecord
  enum invoice_required: { not_required: 0, required: 1 }
  has_many :individual_customers
  belongs_to :invoicing_department
  has_many :companies
  has_many :orders
end
