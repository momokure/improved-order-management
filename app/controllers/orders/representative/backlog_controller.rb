class Orders::Representative::BacklogController < ApplicationController
  def index
    @orders = Order.all
  end
end