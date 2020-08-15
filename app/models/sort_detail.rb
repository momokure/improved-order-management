class SortDetail < ApplicationRecord
  has_many :order_details

  has_many :sort_notes, inverse_of: :sort_detail, dependent: :destroy
  accepts_nested_attributes_for :sort_notes, reject_if: :all_blank, allow_destroy: true
end
