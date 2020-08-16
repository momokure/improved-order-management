class Company < ApplicationRecord
  belongs_to :payment_method
  has_many :company_customers
  has_many :customers, through: :company_customers
  has_many :company_notes
end
