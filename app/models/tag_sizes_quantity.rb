class TagSizesQuantity < ApplicationRecord
  belongs_to :customer_tag
  belongs_to :tag_size
end
