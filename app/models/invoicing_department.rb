class InvoicingDepartment < ApplicationRecord
  has_many :payment_methods
  has_many :departments
end
