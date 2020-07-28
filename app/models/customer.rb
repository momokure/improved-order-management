class Customer < ApplicationRecord
  belongs_to :customer_type
  has_many :customer_notes
  accepts_nested_attributes_for :customer_notes
end
