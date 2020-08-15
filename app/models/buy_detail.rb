class BuyDetail < ApplicationRecord
  belongs_to :order_detail

  has_many :buy_notes, inverse_of: :buy_detail, dependent: :destroy
  accepts_nested_attributes_for :buy_notes, reject_if: :all_blank, allow_destroy: true
end