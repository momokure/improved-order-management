class SortDetail < ApplicationRecord
  belongs_to :order_detail
  belongs_to :sorting_user, class_name: "User"

  has_many :sort_notes, inverse_of: :sort_detail, dependent: :destroy
  accepts_nested_attributes_for :sort_notes, reject_if: :all_blank, allow_destroy: true
end
