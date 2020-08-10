class Customer < ApplicationRecord
  include IdGeneratorCustomer

  belongs_to :customer_type

  has_one :individual_customer
  accepts_nested_attributes_for :individual_customer

  has_many :company_customers
  has_many :companies, through: :company_customers
  accepts_nested_attributes_for :companies, reject_if: :reject_company

  def reject_company(attributed)
    attributed['company_name'].blank?
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture_code
  has_many :customer_addresses
  accepts_nested_attributes_for :customer_addresses

  has_many :customer_notes
  accepts_nested_attributes_for :customer_notes, reject_if: :reject_customer_note

  def reject_customer_note(attributed)
    attributed['customer_note'].blank?
  end

  has_many :customer_emails
  accepts_nested_attributes_for :customer_emails, reject_if: :reject_customer_email

  def reject_customer_email(attributed)
    attributed['customer_email'].blank?
  end

  has_many :customer_phone_numbers
  accepts_nested_attributes_for :customer_phone_numbers, reject_if: :reject_customer_phone_number

  def reject_customer_phone_number(attributed)
    attributed['customer_phone_number'].blank?
  end

  has_many :orders
end
