class CustomerTag < ApplicationRecord
  belongs_to :tag_sewing_method
  belongs_to :customer

  has_many :tag_sizes_quantities
  has_many :tag_sizes, through: :tag_sizes_quantities
  accepts_nested_attributes_for :tag_sizes

  has_many :tag_photos
  has_many :tag_notes
end