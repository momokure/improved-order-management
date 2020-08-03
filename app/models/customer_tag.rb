class CustomerTag < ApplicationRecord
  enum cut_the_tag: { uncut: 0, cut: 1 }

  belongs_to :tag_sewing_method
  belongs_to :customer

  has_many :tag_sizes_quantities
  has_many :tag_sizes, through: :tag_sizes_quantities
  accepts_nested_attributes_for :tag_sizes

  has_many :tag_photos
  accepts_nested_attributes_for :tag_photos

  has_many :tag_notes
  accepts_nested_attributes_for :tag_notes
end