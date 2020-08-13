class OrderTechniqueDetail < ApplicationRecord
  belongs_to :order_detail
  belongs_to :technique
  belongs_to :progress
  belongs_to :representative_user, class_name: "User"
  belongs_to :pastup_user, class_name: "User"
  belongs_to :maker, class_name: "User"
end
