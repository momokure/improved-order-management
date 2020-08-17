class Representative::WipController < ApplicationController
  def index
    @orders = Order.where(representative_user_id: current_user.id, payment_confirmation: "unconfirmed")
  end
end