class Customer < ApplicationRecord
  include IdGeneratorCustomer

  def to_param
    uid
  end

  belongs_to :customer_type

  has_one :individual_customer
  accepts_nested_attributes_for :individual_customer

  has_many :company_customers
  has_many :companies, through: :company_customers
  accepts_nested_attributes_for :companies, reject_if: :all_blank

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture_code
  has_many :customer_addresses
  accepts_nested_attributes_for :customer_addresses

  has_many :customer_notes
  accepts_nested_attributes_for :customer_notes, reject_if: :all_blank

  has_many :customer_emails
  accepts_nested_attributes_for :customer_emails, reject_if: :all_blank

  has_many :customer_phone_numbers
  accepts_nested_attributes_for :customer_phone_numbers, reject_if: :all_blank

  has_many :orders
end
