class Order < ApplicationRecord
  after_initialize :set_default_values

  def to_param
    uid
  end

  enum domestic_buying: { not_included: false, included: true }, _prefix: true
  enum overseas_buying: { not_included: false, included: true }, _prefix: true
  enum carry_in: { not_included: false, included: true }, _prefix: true
  enum payment_confirmation: {unconfirmed: false, confirmed: true }
  enum send_receipt: { unsent: false, sent: true }, _prefix: true
  enum send_invoice: { unsent: false, sent: true }, _prefix: true
  enum shipment_status: { not_shipped: false, shipped: true }

  belongs_to :customer
  belongs_to :order_reflect_user, class_name: "User"
  belongs_to :csr_user, class_name: "User"
  belongs_to :shipment_user, class_name: "User"
  belongs_to :order_type
  belongs_to :quote_difficulty_level
  belongs_to :payment_method
  belongs_to :specified_time

  has_many :order_details
  accepts_nested_attributes_for :order_details

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture_code
  has_many :order_addresses
  accepts_nested_attributes_for :order_addresses

  has_many :order_notes
  accepts_nested_attributes_for :order_notes

  private

  def set_default_values
    self.uid ||= loop do
      uid = 'CP' + [*0..9, *'A'..'Z'].sample(14)*''
      break uid unless self.class.exists?(uid: uid)
    end
  end
end
