class PaymentMethod < ApplicationRecord
  enum invoice_required: { not_required: false, required: true }
  has_many :individual_customers
  belongs_to :invoicing_department
  has_many :companies
  has_many :orders
end
