class Company < ApplicationRecord
  belongs_to :payment_method
  belongs_to :receipt_required
  has_many :customers_companies
  has_many :customers, through: :customers_companies
end
