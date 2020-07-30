class TagSize < ApplicationRecord
  has_many :tag_sizes_quantities
  has_many :customer_tags, through: :tag_sizes_quantities
end
