class Pasteup::BacklogController < ApplicationController
  def index
    @orders = Order.all
  end
end