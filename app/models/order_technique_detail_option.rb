class OrderTechniqueDetailOption < ApplicationRecord
  belongs_to :order_detail
  belongs_to :technique_option
end