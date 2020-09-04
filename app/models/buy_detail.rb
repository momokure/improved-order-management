class BuyDetail < ApplicationRecord
  belongs_to :order
  belongs_to :buy_progress

  has_many :overseas_buying_details, inverse_of: :buy_detail, dependent: :destroy
  accepts_nested_attributes_for :overseas_buying_details, reject_if: :all_blank, allow_destroy: true

  has_many :buy_notes, inverse_of: :buy_detail, dependent: :destroy
  accepts_nested_attributes_for :buy_notes, reject_if: :all_blank, allow_destroy: true
end