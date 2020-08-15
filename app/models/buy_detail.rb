class BuyDetail < ApplicationRecord
  has_many :order_details
  has_many :buy_notes
end
