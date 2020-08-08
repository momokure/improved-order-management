class OrderTechniqueDetail < ApplicationRecord
  belongs_to :order_detail
  belongs_to :technique
  belongs_to :progress
end
