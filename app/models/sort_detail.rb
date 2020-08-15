class SortDetail < ApplicationRecord
  has_many :order_details
  has_many :sort_notes
end
