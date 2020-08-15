class Payment < ApplicationRecord
  belongs_to :order
  belongs_to :accounting_user, class_name: "User"
  has_many :payment_notes, inverse_of: :payment, dependent: :destroy
  accepts_nested_attributes_for :payment_notes, reject_if: :all_blank, allow_destroy: true
end
