class OrdersController < ApplicationController
  before_action :authenticate_user!

  def new
    @customer = Customer.find(params[:customer_id])
    @order = Order.new
    # @order.build_individual_customer
    # @order.companies.build
  end

  def create
    order = Order.new(order_params)
    order.save!
  end

  def show
    @order = Order.find(params[:id])
    @customer = Customer.find(@order.customer_id)
  end

  private
  def order_params
    params
      .require(:order)
      .permit(
        :customer_id, :order_reflect_user_id, :csr_user_id,
        :order_type_id, :quote_difficulty_level_id, :payment_method_id,
        :order_date, :first_response_date, :desired_delivery_date, :internal_delivery_date, :specified_time_id,
        :domestic_buying, :overseas_buying, :carry_in,
        :payment_deadline_date, :payment_amount, :payment_confirmation,
        :send_receipt, :send_invoice,
        :shipment_status, :shipment_date, :shipment_user_id,
        :cancellation
        # individual_customer_attributes: [:payment_method_id, :receipt_required],
        # companies_attributes: [:company_name, :company_name_furigana, :payment_method_id, :receipt_required],
        # customer_emails_attributes: [:customer_email],
        # customer_phone_numbers_attributes: [:customer_phone_number],
        # customer_notes_attributes: [:customer_note]
      )
  end
end