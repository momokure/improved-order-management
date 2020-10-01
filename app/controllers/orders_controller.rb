class OrdersController < ApplicationController
  require 'date'
  PER = 100

  def index
    @q = Order.includes(:representative_user, :order_addresses, :payments, :buy_details, :order_notes)
           .order(order_date: "DESC")
           .page(params[:page]).per(PER)
           .ransack(params[:q])
    @orders = @q.result(distinct: true).per(PER)
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
    respond_to do |format|
      format.html
      format.pdf do
      render pdf: @order.uid+' '+@customer.customer_name,   # PDF名
             template: 'orders/show.html.haml' # viewを対象にする
      end
    end
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

    @silkscreen_a_pending = Order.left_joins(order_details: :order_technique_details)
                              .where(order_details: { factory_id: 1 })
                              .where(order_technique_details: { technique_id: 1 })
                              .group("orders.internal_delivery_date")
                              .count

    @silkscreen_a_toda1_wip = Order.left_joins(order_details: :order_technique_details)
                                .where(order_details: { factory_id: 4 })
                                .where(order_technique_details: { technique_id: 1 })
                                .where.not(order_technique_details: { progress_id: 7  })
                                .group("orders.internal_delivery_date")
                                .count

    @silkscreen_a_toda1_done = Order.left_joins(order_details: :order_technique_details)
                                .where(order_details: { factory_id: 4 })
                                .where(order_technique_details: { technique_id: 1 })
                                .where(order_technique_details: { progress_id: 7  })
                                .group("orders.internal_delivery_date")
                                .count

    @silkscreen_a_bijogi_wip = Order.left_joins(order_details: :order_technique_details)
                                 .where(order_details: { factory_id: 8 })
                                 .where(order_technique_details: { technique_id: 1 })
                                 .where.not(order_technique_details: { progress_id: 7  })
                                 .group("orders.internal_delivery_date")
                                 .count

    @silkscreen_a_bijogi_done = Order.left_joins(order_details: :order_technique_details)
                                 .where(order_details: { factory_id: 8 })
                                 .where(order_technique_details: { technique_id: 1 })
                                 .where(order_technique_details: { progress_id: 7  })
                                 .group("orders.internal_delivery_date")
                                 .count

    @inkjet_pending = Order.left_joins(order_details: :order_technique_details)
                        .where(order_details: { factory_id: 1 })
                        .where(order_technique_details: { technique_id: 4 })
                        .group("orders.internal_delivery_date")
                        .count

    @inkjet_toda1_wip = Order.left_joins(order_details: :order_technique_details)
                          .where(order_details: { factory_id: 4 })
                          .where(order_technique_details: { technique_id: 4 })
                          .where.not(order_technique_details: { progress_id: 7  })
                          .group("orders.internal_delivery_date")
                          .count

    @inkjet_toda1_done = Order.left_joins(order_details: :order_technique_details)
                          .where(order_details: { factory_id: 4 })
                          .where(order_technique_details: { technique_id: 4 })
                          .where(order_technique_details: { progress_id: 7  })
                          .group("orders.internal_delivery_date")
                          .count

    @inkjet_bijogi_wip = Order.left_joins(order_details: :order_technique_details)
                           .where(order_details: { factory_id: 8 })
                           .where(order_technique_details: { technique_id: 4 })
                           .where.not(order_technique_details: { progress_id: 7  })
                           .group("orders.internal_delivery_date")
                           .count

    @inkjet_bijogi_done = Order.left_joins(order_details: :order_technique_details)
                           .where(order_details: { factory_id: 8 })
                           .where(order_technique_details: { technique_id: 4 })
                           .where(order_technique_details: { progress_id: 7  })
                           .group("orders.internal_delivery_date")
                           .count

    @embroidery_pending = Order.left_joins(order_details: :order_technique_details)
                          .where(order_details: { factory_id: 1 })
                          .where(order_technique_details: { technique_id: 5 })
                          .group("orders.internal_delivery_date")
                          .count

    @embroidery_toda1_wip = Order.left_joins(order_details: :order_technique_details)
                              .where(order_details: { factory_id: 4 })
                              .where(order_technique_details: { technique_id: 5 })
                              .where.not(order_technique_details: { progress_id: 7  })
                              .group("orders.internal_delivery_date")
                              .count

    @embroidery_toda1_done = Order.left_joins(order_details: :order_technique_details)
                              .where(order_details: { factory_id: 4 })
                              .where(order_technique_details: { technique_id: 5 })
                              .where(order_technique_details: { progress_id: 7  })
                              .group("orders.internal_delivery_date")
                              .count

    @embroidery_bijogi_wip = Order.left_joins(order_details: :order_technique_details)
                               .where(order_details: { factory_id: 8 })
                               .where(order_technique_details: { technique_id: 5 })
                               .where.not(order_technique_details: { progress_id: 7  })
                               .group("orders.internal_delivery_date")
                               .count

    @embroidery_bijogi_done = Order.left_joins(order_details: :order_technique_details)
                               .where(order_details: { factory_id: 8 })
                               .where(order_technique_details: { technique_id: 5 })
                               .where(order_technique_details: { progress_id: 7  })
                               .group("orders.internal_delivery_date")
                               .count

    @sewing_pending = Order.left_joins(order_details: :order_technique_details)
                        .where(order_details: { factory_id: 1 })
                        .where(order_technique_details: { technique_id: 6 })
                        .group("orders.internal_delivery_date")
                        .count

    @sewing_toda1_wip = Order.left_joins(order_details: :order_technique_details)
                          .where(order_details: { factory_id: 4 })
                          .where(order_technique_details: { technique_id: 6 })
                          .where.not(order_technique_details: { progress_id: 7  })
                          .group("orders.internal_delivery_date")
                          .count

    @sewing_toda1_done = Order.left_joins(order_details: :order_technique_details)
                           .where(order_details: { factory_id: 4 })
                           .where(order_technique_details: { technique_id: 6 })
                           .where(order_technique_details: { progress_id: 7  })
                           .group("orders.internal_delivery_date")
                           .count

    @sewing_bijogi_wip = Order.left_joins(order_details: :order_technique_details)
                           .where(order_details: { factory_id: 8 })
                           .where(order_technique_details: { technique_id: 6 })
                           .where.not(order_technique_details: { progress_id: 7  })
                           .group("orders.internal_delivery_date")
                           .count

    @sewing_bijogi_done = Order.left_joins(order_details: :order_technique_details)
                           .where(order_details: { factory_id: 8 })
                           .where(order_technique_details: { technique_id: 6 })
                           .where(order_technique_details: { progress_id: 7  })
                           .group("orders.internal_delivery_date")
                           .count

    @silkscreen_b_wip = Order.left_joins(order_details: :order_technique_details)
                          .where(order_technique_details: { technique_id: 2 })
                          .where.not(order_technique_details: { progress_id: 7  })
                          .group("orders.internal_delivery_date")
                          .count
    #シルクスクリーンBの見積もり済み指示書の未製作件数🐤
    @silkscreen_b_pasteup_wip = Order.joins(order_details: :order_technique_details)
                          .where(order_technique_details: { technique_id: 2 })
                          .where(order_technique_details: { progress_id: 1  })
                          .group("orders.internal_delivery_date")
                          .count

    @silkscreen_b_done = Order.left_joins(order_details: :order_technique_details)
                           .where(order_technique_details: { technique_id: 2 })
                           .where(order_technique_details: { progress_id: 7  })
                           .group("orders.internal_delivery_date")
                           .count

    @silkscreen_c_wip = Order.left_joins(order_details: :order_technique_details)
                          .where(order_technique_details: { technique_id: 3 })
                          .where.not(order_technique_details: { progress_id: 7  })
                          .group("orders.internal_delivery_date")
                          .count

    @silkscreen_c_done = Order.left_joins(order_details: :order_technique_details)
                           .where(order_technique_details: { technique_id: 3 })
                           .where(order_technique_details: { progress_id: 7  })
                           .group("orders.internal_delivery_date")
                           .count

    @silkscreen_d_wip = Order.left_joins(order_details: :order_technique_details)
                          .where(order_technique_details: { technique_id: 8 })
                          .where.not(order_technique_details: { progress_id: 7  })
                          .group("orders.internal_delivery_date")
                          .count

    @silkscreen_d_done = Order.left_joins(order_details: :order_technique_details)
                          .where(order_technique_details: { technique_id: 8 })
                          .where(order_technique_details: { progress_id: 7  })
                          .group("orders.internal_delivery_date")
                          .count

    @silkscreen_d_cassette = Order.left_joins(order_details: :order_technique_detail_options)
                                   .where(order_technique_detail_options: { technique_option_id: 5 })
                                   .group("orders.internal_delivery_date")
                                   .count

    @blank_toda1_wip = Order.left_joins(order_details: :order_technique_details)
                          .where(order_details: { factory_id: 4 })
                          .where(order_technique_details: { technique_id: 9 })
                          .where.not(order_technique_details: { progress_id: 7  })
                          .group("orders.internal_delivery_date")
                          .count

    @blank_toda1_done = Order.left_joins(order_details: :order_technique_details)
                           .where(order_details: { factory_id: 4 })
                           .where(order_technique_details: { technique_id: 9 })
                           .where(order_technique_details: { progress_id: 7  })
                           .group("orders.internal_delivery_date")
                           .count

    @blank_bijogi_wip = Order.left_joins(order_details: :order_technique_details)
                         .where(order_details: { factory_id: 8 })
                         .where(order_technique_details: { technique_id: 9 })
                         .where.not(order_technique_details: { progress_id: 7  })
                         .group("orders.internal_delivery_date")
                         .count

    @blank_bijogi_done = Order.left_joins(order_details: :order_technique_details)
                          .where(order_details: { factory_id: 8 })
                          .where(order_technique_details: { technique_id: 9 })
                          .where(order_technique_details: { progress_id: 7  })
                          .group("orders.internal_delivery_date")
                          .count

    @blank_yoyogi_wip = Order.left_joins(order_details: :order_technique_details)
                          .where(order_details: { factory_id: 7 })
                          .where(order_technique_details: { technique_id: 9 })
                          .where.not(order_technique_details: { progress_id: 7  })
                          .group("orders.internal_delivery_date")
                          .count

    @blank_yoyogi_done = Order.left_joins(order_details: :order_technique_details)
                           .where(order_details: { factory_id: 7 })
                           .where(order_technique_details: { technique_id: 9 })
                           .where(order_technique_details: { progress_id: 7  })
                           .group("orders.internal_delivery_date")
                           .count

    @uv_wip = Order.left_joins(order_details: :order_technique_details)
                .where(order_technique_details: { technique_id: 7 })
                .where.not(order_technique_details: { progress_id: 7  })
                .group("orders.internal_delivery_date")
                .count

    @uv_done = Order.left_joins(order_details: :order_technique_details)
                 .where(order_technique_details: { technique_id: 7 })
                 .where(order_technique_details: { progress_id: 7  })
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
        :payment_deadline_date, :payment_amount, :difference, :payment_confirmation,
        :send_receipt, :send_invoice,
        :cancellation,
        order_details_attributes: [:id, :mixed_techniques, :factory_id, :_destroy,
                                   order_detail_options_attributes: [:id, :order_option_id, :_destroy],
                                   order_technique_details_attributes: [:id, :technique_id, :progress_id, :pasteup_user_id, :maker_id, :_destroy],
                                   order_technique_detail_options_attributes: [:id, :technique_option_id, :_destroy],
                                   sort_details_attributes: [:id, :sort_date, :order_detail_id, :sorting_user_id, :_destroy,
                                                             sort_notes_attributes: [:id, :sort_note, :sort_detail_id, :user_id, :_destroy]
                                   ],
                                   order_tags_attributes: [:id, :custody_tag_status, :custody_request, :sewing_user_id, :_destroy,
                                                           order_tag_notes_attributes: [:id, :order_tag_note, :order_tags_id, :user_id, :_destroy]
                                   ]
        ],
        payments_attributes: [:id, :payment_date, :amount_paid, :accounting_user_id, :_destroy,
                              payment_notes_attributes: [:id, :payment_note, :user_id, :_destroy]
        ],
        buy_details_attributes: [:id, :buy_progress_id, :purchase_date, :buy_type_id, :buying_user_id ,:_destroy,
                                 overseas_buying_details_attributes: [:id, :sort, :transfer, :buying_user_id, :buy_detail_id, :_destroy],
                                 buy_notes_attributes: [:id, :buy_note, :buy_detail_id, :user_id, :_destroy]
        ],
        shipments_attributes: [:id, :shipment_date, :factory_id, :shipment_user_id, :_destroy,
                               shipment_notes_attributes: [:id, :shipment_note, :user_id, :_destroy]
        ],
        customer_addresses_attributes: [:id, :prefecture_code, :customer_id, :_destroy],
        order_notes_attributes: [:id, :order_note, :user_id, :_destroy]
    )
  end
end
