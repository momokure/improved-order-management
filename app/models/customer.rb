class Customer < ApplicationRecord
  belongs_to :customer_type
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
end
