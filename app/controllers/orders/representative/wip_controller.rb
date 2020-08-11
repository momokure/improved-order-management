class Orders::Representative::WipController < ApplicationController
  def index
    @orders = Order.all
  end
end