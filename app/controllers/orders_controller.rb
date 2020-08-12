class OrdersController < ApplicationController
  before_action :authenticate_user!

  def new
    @customer = Customer.find_by(uid: params[:customer_id])
    @order = Order.new
    order_detail = @order.order_details.build
    order_detail.order_technique_details.build
    order_detail.order_technique_detail_options.build
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

  private
  def order_params
    params
      .require(:order)
      .permit(
        :uid, :customer_id, :order_reflect_user_id, :representative_user_id,
        :order_type_id, :quote_difficulty_level_id, :payment_method_id,
        :order_date, :first_response_date, :desired_delivery_date, :desired_delivery_type_id, :internal_delivery_date, :specified_time_id,
        :domestic_buying, :overseas_buying, :carry_in,
        :payment_deadline_date, :payment_amount, :payment_confirmation,
        :send_receipt, :send_invoice,
        :shipment_status, :shipment_date, :shipment_user_id,
        :cancellation,
        order_details_attributes: [:mixed_techniques, :large_order, :factory_id,
                                   order_technique_details_attributes: [:technique_id, :progress_id],
                                   order_technique_detail_options_attributes: [:technique_option_id],
        ],
        order_addresses_attributes: [:customer_address_id],
        order_notes_attributes: [:order_note, :user_id]
    )
  end
end