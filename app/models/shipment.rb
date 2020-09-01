class Shipment < ApplicationRecord
  belongs_to :order
  belongs_to :shipment_user, class_name: "User"
  has_many :shipment_notes
  accepts_nested_attributes_for :shipment_notes, reject_if: :all_blank, allow_destroy: true
end