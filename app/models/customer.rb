class Customer < ApplicationRecord
  include IdGeneratorCustomer
  enum receipt_required: { not_required: false, required: true }
  enum sales:  { received: false, sales: true }

  def to_param
    uid
  end

  belongs_to :customer_type

  belongs_to :company
  # accepts_nested_attributes_for :companies, reject_if: :all_blank, allow_destroy: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture_code
  has_many :customer_addresses, dependent: :destroy, inverse_of: :customer
  accepts_nested_attributes_for :customer_addresses, allow_destroy: true

  has_many :customer_notes, dependent: :destroy, inverse_of: :customer
  accepts_nested_attributes_for :customer_notes, reject_if: :all_blank, allow_destroy: true

  has_many :customer_emails, dependent: :destroy, inverse_of: :customer
  accepts_nested_attributes_for :customer_emails, reject_if: :all_blank, allow_destroy: true

  has_many :customer_phone_numbers, dependent: :destroy, inverse_of: :customer
  accepts_nested_attributes_for :customer_phone_numbers, reject_if: :all_blank, allow_destroy: true

  has_many :orders
end
