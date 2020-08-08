class CustomerAddress < ApplicationRecord
  belongs_to :customer
  has_many :order_addresses
end
