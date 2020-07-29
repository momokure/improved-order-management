class Department < ApplicationRecord
  belongs_to :invoicing_department
  has_many :users_departments
  has_many :users, through: :users_departments
end
