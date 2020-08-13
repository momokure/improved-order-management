class OrdersController < ApplicationController
  before_action :authenticate_user!

  def new
    @customer = Customer.find_by(uid: params[:customer_id])
    @order = Order.new
    @order.order_addresses.build
    @order.order_notes.build
  end

  def create
    order = Order.new(order_params)
    order.save!
    redirect_to customers_path
  end

  def show
    @order = Order.find_by(uid: params[:id])
    @customer = Customer.find_by(uid: @order.customer_id)
  end

  def edit
    @order = Order.find_by(uid: params[:id])
    @customer = Customer.find(@order.customer_id)
  end

  def update
    @order = Order.find_by(uid: params[:id])
    # @order.representative_user_id = current_user.id
    @order.update_attributes!(order_params)
    # redirect_to edit_order_path
  end

  def destroy
    @order = Order.find_by(uid: params[:id])
    @order.destroy!
  end

  private
  def order_params
    params
      .require(:order)
      .permit(
        :id, :uid, :customer_id, :order_reflect_user_id, :representative_user_id,
        :order_type_id, :quote_difficulty_level_id, :payment_method_id,
        :order_date, :first_response_date, :desired_delivery_date, :desired_delivery_type_id, :internal_delivery_date, :specified_time_id,
        :domestic_buying, :overseas_buying, :carry_in,
        :payment_deadline_date, :payment_amount, :payment_confirmation,
        :send_receipt, :send_invoice,
        :shipment_status, :shipment_date, :shipment_user_id,
        :cancellation,
        order_details_attributes: [:id, :mixed_techniques, :factory_id, :_destroy,
                                   order_detail_options_attributes: [:id, :order_option_id, :_destroy],
                                   order_technique_details_attributes: [:id, :technique_id, :progress_id, :representative_user_id, :pasteup_user_id, :maker_id, :_destroy],
                                   order_technique_detail_options_attributes: [:id, :technique_option_id, :_destroy]
        ],
        order_addresses_attributes: [:id, :customer_address_id],
        order_notes_attributes: [:id, :order_note, :user_id]
    )
  end
end