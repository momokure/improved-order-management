class CustomerAddress < ApplicationRecord
  belongs_to :customer
  has_many :order_addresses

  def view_prefecture_name
    PrefectureCode.find(self.prefecture_code).name
  end
end
