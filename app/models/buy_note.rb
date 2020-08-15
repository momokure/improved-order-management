class BuyNote < ApplicationRecord
  belongs_to :buy_detail
  belongs_to :user
end
