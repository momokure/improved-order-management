class CustomerTagsController < ApplicationController
  def new
    @customer_tag = CustomerTag.new
    @customer = Customer.find(params[:customer_id])
  end

  def create
    customer_tag = CustomerTag.new(customer_tag_params)
    customer_tag.save!
  end

  private
  def customer_tag_params
    params
      .require(:customer_tag)
      .permit(
        :tag_name, :customer_id, :tag_sewing_method_id
      )
  end
end
