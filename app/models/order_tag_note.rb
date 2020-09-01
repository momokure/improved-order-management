class OrderTagNote < ApplicationRecord
  belongs_to :order_tag
  belongs_to :user
end
