class Company < ApplicationRecord
  validates :company_name, uniqueness: true

  has_many :customers
  has_many :company_notes
end
