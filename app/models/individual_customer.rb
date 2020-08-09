class IndividualCustomer < ApplicationRecord
  enum receipt_required: { not_required: false, required: true }
  belongs_to :customer
  belongs_to :payment_method
end
