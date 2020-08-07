class Company < ApplicationRecord
  enum receipt_required: { not_required: false, required: true }
  belongs_to :payment_method
  has_many :company_customers
  has_many :customers, through: :company_customers
  has_many :company_notes
end
