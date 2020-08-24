class OrdersController < ApplicationController
  require 'date'

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

    if Department.find(UsersDepartment.find_by(user_id: current_user.id).department_id).id == 2
      redirect_to root_path
    elsif Department.find(UsersDepartment.find_by(user_id: current_user.id).department_id).id == 3
      redirect_to representative_wip_index_path
    elsif Department.find(UsersDepartment.find_by(user_id: current_user.id).department_id).id == 4
      redirect_to root_path
    end
  end

  def destroy
    @order = Order.find_by(uid: params[:id])
    @order.destroy!
  end

  def calendar
    @start = Date.today.prev_occurring(:sunday)
    @end = @start.next_month.next_month.end_of_week
    @count_day = Date.today.prev_occurring(:sunday) -1

    @silkscreen_a_toda1 = Order.joins(order_details: :order_technique_details)
                          .where(order_details: { factory_id: 4 })
                          .where(order_technique_details: { technique_id: 1 })
                          .group("orders.internal_delivery_date")
                          .count

    @silkscreen_a_bijogi = Order.joins(order_details: :order_technique_details)
                          .where(order_details: { factory_id: 8 })
                          .where(order_technique_details: { technique_id: 1 })
                          .group("orders.internal_delivery_date")
                          .count

    @inkjet_toda1 = Order.joins(order_details: :order_technique_details)
                .where(order_details: { factory_id: 4 })
                .where(order_technique_details: { technique_id: 4 })
                .group("orders.internal_delivery_date")
                .count

    @inkjet_bijogi = Order.joins(order_details: :order_technique_details)
                      .where(order_details: { factory_id: 8 })
                      .where(order_technique_details: { technique_id: 4 })
                      .group("orders.internal_delivery_date")
                      .count

    @embroidery_toda1 = Order.joins(order_details: :order_technique_details)
                      .where(order_details: { factory_id: 4 })
                      .where(order_technique_details: { technique_id: 5 })
                      .group("orders.internal_delivery_date")
                      .count

    @embroidery_bijogi = Order.joins(order_details: :order_technique_details)
                       .where(order_details: { factory_id: 8 })
                       .where(order_technique_details: { technique_id: 5 })
                       .group("orders.internal_delivery_date")
                       .count

    @sewing_toda1 = Order.joins(order_details: :order_technique_details)
                          .where(order_details: { factory_id: 4 })
                          .where(order_technique_details: { technique_id: 6 })
                          .group("orders.internal_delivery_date")
                          .count

    @sewing_bijogi = Order.joins(order_details: :order_technique_details)
                           .where(order_details: { factory_id: 8 })
                           .where(order_technique_details: { technique_id: 6 })
                           .group("orders.internal_delivery_date")
                           .count

    @silkscreen_b = Order.joins(order_details: :order_technique_details)
                   .where(order_technique_details: { technique_id: 2 })
                   .group("orders.internal_delivery_date")
                   .count

    @silkscreen_c = Order.joins(order_details: :order_technique_details)
                   .where(order_technique_details: { technique_id: 3 })
                   .group("orders.internal_delivery_date")
                   .count

    @silkscreen_d = Order.joins(order_details: :order_technique_details)
                      .where(order_technique_details: { technique_id: 8 })
                      .group("orders.internal_delivery_date")
                      .count

    @uv = Order.joins(order_details: :order_technique_details)
            .where(order_technique_details: { technique_id: 7 })
            .group("orders.internal_delivery_date")
            .count
  end

  private
  def order_params
    params
      .require(:order)
      .permit(
        :id, :uid, :customer_id, :order_reflect_user_id, :representative_user_id,
        :order_type_id, :quote_difficulty_level_id, :payment_method_id,
        :order_date, :first_response_date, :desired_delivery_date, :desired_delivery_type_id, :internal_delivery_date,
        :specified_time_id, :change_delivery_date,
        :domestic_buying, :overseas_buying, :carry_in,
        :payment_deadline_date, :payment_amount, :payment_confirmation,
        :send_receipt, :send_invoice,
        :shipment_date, :shipment_user_id,
        :cancellation,
        order_details_attributes: [:id, :mixed_techniques, :factory_id, :_destroy,
                                   order_detail_options_attributes: [:id, :order_option_id, :_destroy],
                                   order_technique_details_attributes: [:id, :technique_id, :progress_id, :pasteup_user_id, :maker_id, :_destroy],
                                   order_technique_detail_options_attributes: [:id, :technique_option_id, :_destroy]
        ],
        payments_attributes: [:id, :payment_date, :amount_paid, :accounting_user_id, :_destroy,
                              payment_notes_attributes: [:id, :payment_note, :user_id, :_destroy]
        ],
        buy_details_attributes: [:id, :buy_progress_id, :purchase_date, :arrival_date, :buy_type_id, :supplier_id, :order_detail_id, :buying_user_id ,:_destroy,
                                 buy_notes_attributes: [:id, :buy_note, :buy_detail_id, :user_id, :_destroy]
        ],
        sort_details_attributes: [:id, :buy_type_id, :order_detail_id, :sorting_user_id, :_destroy,
                                  sort_notes_attributes: [:id, :sort_note, :sort_detail_id, :user_id, :_destroy]
        ],
        customer_addresses_attributes: [:id, :prefecture_code, :customer_id, :_destroy],
        order_notes_attributes: [:id, :order_note, :user_id, :_destroy]
    )
  end
end