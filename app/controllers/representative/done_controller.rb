class Representative::DoneController < ApplicationController
  def index
    @orders = Order.where(representative_user_id: current_user.id, payment_confirmation: "confirmed")
  end
end