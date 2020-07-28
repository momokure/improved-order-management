class Position < ApplicationRecord
  has_many :users_departments
  has_many :users, through: :users_departments
end
