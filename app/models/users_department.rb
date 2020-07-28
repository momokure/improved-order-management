class UsersDepartment < ApplicationRecord
  belongs_to :user
  belongs_to :department
  belongs_to :position
end
