class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def new
    @customer = Customer.find_by(uid: params[:customer_id])
    @order = Order.new
    @order.order_addresses.build
    @order.payments.build
    @order.order_notes.build
  end

  def create
    order = Order.new(order_params)
    order.save!
    redirect_to customers_path
  end

  def show
    @order = Order.find_by(uid: params[:id])
    @customer = Customer.find(@order.customer_id)
  end

  def edit
    @order = Order.find_by(uid: params[:id])
    @customer = Customer.find(@order.customer_id)
  end

  def update_representative_user
    @order = Order.find_by(uid: params[:id])
    @order.update_attributes!(order_params)
    redirect_to edit_order_path
  end

  def update
    @order = Order.find_by(uid: params[:id])
    @order.update_attributes!(order_params)
    if current_user.id == 2
      redirect_to controller: 'representative/wip', action: 'index'
    end
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
                                   order_technique_detail_options_attributes: [:id, :technique_option_id, :_destroy],
                                   buy_details_attributes: [:id, :purchase_date, :arrival_date, :buy_type_id, :supplier_id, :order_detail_id, :buying_user_id ,:_destroy,
                                                            buy_notes_attributes: [:id, :buy_note, :buy_detail_id, :user_id, :_destroy]
                                   ],
                                   sort_details_attributes: [:id, :technique_option_id, :_destroy,
                                                             sort_notes_attributes: [:id, :sort_note, :sort_detail_id, :user_id, :_destroy]
                                   ]
        ],
        payments_attributes: [:id, :payment_date, :amount_paid, :accounting_user_id, :_destroy,
                              payment_notes_attributes: [:id, :payment_note, :user_id, :_destroy]
        ],
        customer_addresses_attributes: [:id, :prefecture_code, :customer_id, :_destroy],
        order_notes_attributes: [:id, :order_note, :user_id]
    )
  end
end