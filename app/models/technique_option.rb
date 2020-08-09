class TechniqueOption < ApplicationRecord
  belongs_to :technique
  has_many :order_technique_detail_options
end
