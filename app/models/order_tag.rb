class OrderTag < ApplicationRecord
  enum custody_tag_status: { unreceived: false, received: true }
  enum custody_request: { no: false, yes: true }

  belongs_to :order_detail
  belongs_to :sewing_user, class_name: "User"

  has_many :order_tag_notes, inverse_of: :order_tag, dependent: :destroy
  accepts_nested_attributes_for :order_tag_notes, reject_if: :all_blank, allow_destroy: true
end
