class CustomerTagsController < ApplicationController
  def new
    @customer_tag = CustomerTag.new
  end

  def create
  end

  private
  def customer_tag_params
  end
end
