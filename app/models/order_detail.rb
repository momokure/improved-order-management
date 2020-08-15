class OrderDetail < ApplicationRecord
  enum mixed_techniques: { unmixed: false, mixed: true }

  belongs_to :order
  # belongs_to :factory

  has_many :order_detail_options, inverse_of: :order_detail, dependent: :destroy
  accepts_nested_attributes_for :order_detail_options, reject_if: :all_blank, allow_destroy: true

  has_many :order_technique_details, inverse_of: :order_detail, dependent: :destroy
  accepts_nested_attributes_for :order_technique_details, reject_if: :all_blank, allow_destroy: true

  has_many :order_technique_detail_options, inverse_of: :order_detail, dependent: :destroy
  accepts_nested_attributes_for :order_technique_detail_options, reject_if: :all_blank, allow_destroy: true


end