class OverseasBuyingDetail < ApplicationRecord
  enum sort: { uncompleted: false, completed: true }, _prefix: true
  enum transfer: { uncompleted: false, completed: true }, _prefix: true

  belongs_to :buy_detail
  belongs_to :buying_user, class_name: "User"
end