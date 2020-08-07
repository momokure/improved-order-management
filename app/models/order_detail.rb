class OrderDetail < ApplicationRecord
  enum mixed_techniques: { unmixed: false, mixed: true }
  enum large_order: { small: false, large: true }

  belongs_to :order
  # belongs_to :factory
end