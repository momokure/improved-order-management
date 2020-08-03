class IndividualCustomer < ApplicationRecord
  enum receipt_required: { not_required: 0, required: 1 }
  belongs_to :customer
  belongs_to :payment_method
end
