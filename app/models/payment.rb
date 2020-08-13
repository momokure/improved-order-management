class Payment < ApplicationRecord
  belongs_to :order
  belongs_to :user
  has_many :payment_notes
end
