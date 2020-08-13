class Pasteup::WipController < ApplicationController
  def index
    @orders = Order.all
  end
end