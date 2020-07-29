class PaymentMethod < ApplicationRecord
  belongs_to :invoicing_department
  has_many :customers
  has_many :companies
end
