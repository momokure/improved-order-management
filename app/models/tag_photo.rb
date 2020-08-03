class TagPhoto < ApplicationRecord
  belongs_to :customer_tag
  mount_uploader :tag_photo, TagPhotoUploader
end
