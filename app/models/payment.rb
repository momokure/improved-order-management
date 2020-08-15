class Payment < ApplicationRecord
  belongs_to :order
  belongs_to :accounting_user, class_name: "User"
  has_many :payment_notes
end
