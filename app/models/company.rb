class Company < ApplicationRecord
  has_many :company_customers
  has_many :customers, through: :company_customers
  has_many :company_notes
end
