class SortNote < ApplicationRecord
  belongs_to :sort_detail
  belongs_to :user
end
