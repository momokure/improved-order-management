class CustomerTagsController < ApplicationController
  def new
    @customer = Customer.find(params[:customer_id])
    @customer_tag = CustomerTag.new
    @customer_tag.tag_notes.build
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
        :tag_name, :tag_type, :tag_position, :brand_name_tag_cut, :composition_tag_cut, :customer_id, :tag_sewing_method_id,
        tag_photos_attributes: [:tag_photo],
        tag_sizes_quantities_attributes: [:tag_size_id, :tag_quantity],
        tag_notes_attributes: [:tag_note]
        )
  end
end