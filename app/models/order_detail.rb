class OrderDetail < ApplicationRecord
  enum mixed_techniques: { unmixed: false, mixed: true }
  enum large_order: { small: false, large: true }

  belongs_to :order
  # belongs_to :factory
  has_many :order_technique_details
  accepts_nested_attributes_for :order_technique_details
  has_many :order_technique_detail_options
  accepts_nested_attributes_for :order_technique_detail_options
end