class Technique < ApplicationRecord
  has_many :order_technique_details
  has_many :technique_options
end
