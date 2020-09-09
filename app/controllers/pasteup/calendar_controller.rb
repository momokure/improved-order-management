class Pasteup::CalendarController < ApplicationController
  require 'date'
  PER = 500

  def index
    @start = Date.today.prev_occurring(:sunday)
    @end = @start.next_month.next_month.end_of_week


    #シルクスクリーンA戸田公園第１の未製作件数
    @silkscreen_a_toda1_wip = Order.joins(order_details: :order_technique_details)
                                .where(order_details: { factory_id: 4 })
                                .where(order_technique_details: { technique_id: 1 })
                                .where.not(order_technique_details: { progress_id: 7  })
                                .group("orders.internal_delivery_date")
                                .count


    #シルクスクリーンA戸田公園第１の指示書未製作件数🐤
    @silkscreen_a_toda1_pasteup_wip = Order.joins(order_details: :order_technique_details)
                                .where(order_details: { factory_id: 4 })
                                .where(order_technique_details: { technique_id: 1 })
                                .where(order_technique_details: { progress_id: 1  })
                                .group("orders.internal_delivery_date")
                                .count

    #シルクスクリーンA戸田公園第１の指示書作成済み🐔
    @silkscreen_a_toda1_done = Order.joins(order_details: :order_technique_details)
                                .where(order_details: { factory_id: 4 })
                                .where(order_technique_details: { technique_id: 1 })
                                .where(order_technique_details: { progress_id: [3,4,5,6,7]  })
                                .group("orders.internal_delivery_date")
                                .count

    #シルクスクリーンA美女木の未製作の件数
    # factory_idが 8（工場が美女木）且つ、technique_idが1（加工方法がシルクスクリーン）且つ、progress_idが7以外（進行工程ステータスが製作完了）のorders.internal_delivery_dateの合計を、数えあげる
    @silkscreen_a_bijogi_wip = Order.joins(order_details: :order_technique_details)
                                 .where(order_details: { factory_id: 8 })
                                 .where(order_technique_details: { technique_id: 1 })
                                 .where.not(order_technique_details: { progress_id: 7  })
                                 .group("orders.internal_delivery_date")
                                 .count

    #シルクスクリーンA美女木の指示書未製作の件数🐤
    @silkscreen_a_bijogi_pasteup_wip = Order.joins(order_details: :order_technique_details)
                                 .where(order_details: { factory_id: 8 })
                                 .where(order_technique_details: { technique_id: 1 })
                                 .where(order_technique_details: { progress_id: 1  })
                                 .group("orders.internal_delivery_date")
                                 .count
    #シルクスクリーンA美女木の指示書作成済み🐔
    @silkscreen_a_bijogi_done = Order.joins(order_details: :order_technique_details)
                                 .where(order_details: { factory_id: 8 })
                                 .where(order_technique_details: { technique_id: 1 })
                                 .where(order_technique_details: { progress_id: [3,4,5,6,7]  })
                                 .group("orders.internal_delivery_date")
                                 .count

    #インクジェットの戸田公園第1の未製作件数
    @inkjet_toda1_wip = Order.joins(order_details: :order_technique_details)
                          .where(order_details: { factory_id: 4 })
                          .where(order_technique_details: { technique_id: 4 })
                          .where.not(order_technique_details: { progress_id: 7  })
                          .group("orders.internal_delivery_date")
                          .count

    #インクジェットの戸田公園第一の見積もり済み指示書の未製作件数🐤
    @inkjet_toda1_pasteup_wip = Order.joins(order_details: :order_technique_details)
                          .where(order_details: { factory_id: 4 })
                          .where(order_technique_details: { technique_id: 4 })
                          .where(order_technique_details: { progress_id: 1  })
                          .group("orders.internal_delivery_date")
                          .count

    #インクジェットの戸田公園第一の指示書作成済み🐔
    @inkjet_toda1_done = Order.joins(order_details: :order_technique_details)
                          .where(order_details: { factory_id: 4 })
                          .where(order_technique_details: { technique_id: 4 })
                          .where(order_technique_details: { progress_id: [3,4,5,6,7]  })
                          .group("orders.internal_delivery_date")
                          .count

    #インクジェットの美女木の未製作件数
    @inkjet_bijogi_wip = Order.joins(order_details: :order_technique_details)
                           .where(order_details: { factory_id: 8 })
                           .where(order_technique_details: { technique_id: 4 })
                           .where.not(order_technique_details: { progress_id: 7  })
                           .group("orders.internal_delivery_date")
                           .count

    #インクジェットの美女木の見積もり済み指示書の未製作件数🐤
    @inkjet_bijogi_pasteup_wip = Order.joins(order_details: :order_technique_details)
                              .where(order_details: { factory_id: 8 })
                              .where(order_technique_details: { technique_id: 4 })
                              .where(order_technique_details: { progress_id: 1  })
                              .group("orders.internal_delivery_date")
                              .count

    #インクジェットの美女木の指示書作成済み🐔
    @inkjet_bijogi_done = Order.joins(order_details: :order_technique_details)
                           .where(order_details: { factory_id: 8 })
                           .where(order_technique_details: { technique_id: 4 })
                           .where(order_technique_details: { progress_id: [3,4,5,6,7]  })
                           .group("orders.internal_delivery_date")
                           .count

    #刺繍の戸田公園第1の未製作件数
    @embroidery_toda1_wip = Order.joins(order_details: :order_technique_details)
                              .where(order_details: { factory_id: 4 })
                              .where(order_technique_details: { technique_id: 5 })
                              .where.not(order_technique_details: { progress_id: 7  })
                              .group("orders.internal_delivery_date")
                              .count

    #刺繍の戸田公園第1の見積もり済み指示書の未製作件数🐤
    @embroidery_toda1_pasteup_wip = Order.joins(order_details: :order_technique_details)
                              .where(order_details: { factory_id: 4 })
                              .where(order_technique_details: { technique_id: 5 })
                              .where(order_technique_details: { progress_id: 1  })
                              .group("orders.internal_delivery_date")
                              .count

    #刺繍の戸田公園第１の指示書作成済み🐔
    @embroidery_toda1_done = Order.joins(order_details: :order_technique_details)
                              .where(order_details: { factory_id: 4 })
                              .where(order_technique_details: { technique_id: 5 })
                              .where(order_technique_details: { progress_id: [3,4,5,6,7]  })
                              .group("orders.internal_delivery_date")
                              .count

    #刺繍の美女木の未製作件数
    @embroidery_bijogi_wip = Order.joins(order_details: :order_technique_details)
                               .where(order_details: { factory_id: 8 })
                               .where(order_technique_details: { technique_id: 5 })
                               .where.not(order_technique_details: { progress_id: 7  })
                               .group("orders.internal_delivery_date")
                               .count


    #刺繍の美女木の見積もり済み指示書の未製作件数🐤
    @embroidery_bijogi_pasteup_wip = Order.joins(order_details: :order_technique_details)
                               .where(order_details: { factory_id: 8 })
                               .where(order_technique_details: { technique_id: 5 })
                               .where(order_technique_details: { progress_id: 1  })
                               .group("orders.internal_delivery_date")
                               .count

    #刺繍の美女木の指示書作成済み🐔
    @embroidery_bijogi_done = Order.joins(order_details: :order_technique_details)
                               .where(order_details: { factory_id: 8 })
                               .where(order_technique_details: { technique_id: 5 })
                               .where(order_technique_details: { progress_id: [3,4,5,6,7]  })
                               .group("orders.internal_delivery_date")
                               .count

    #縫製の戸田公園第１の未製作件数
    @sewing_toda1_wip = Order.joins(order_details: :order_technique_details)
                          .where(order_details: { factory_id: 4 })
                          .where(order_technique_details: { technique_id: 6 })
                          .where.not(order_technique_details: { progress_id: 7  })
                          .group("orders.internal_delivery_date")
                          .count

    #縫製の戸田公園第１の見積もり済み指示書の未製作件数🐤
    @sewing_toda1_pasteup_wip = Order.joins(order_details: :order_technique_details)
                          .where(order_details: { factory_id: 4 })
                          .where(order_technique_details: { technique_id: 6 })
                          .where(order_technique_details: { progress_id: 1  })
                          .group("orders.internal_delivery_date")
                          .count

    #縫製の戸田公園第１の指示書作成済み🐔
    @sewing_toda1_done = Order.joins(order_details: :order_technique_details)
                           .where(order_details: { factory_id: 4 })
                           .where(order_technique_details: { technique_id: 6 })
                           .where(order_technique_details: { progress_id: [3,4,5,6,7]  })
                           .group("orders.internal_delivery_date")
                           .count

    #縫製の美女木の未製作件数
    @sewing_bijogi_wip = Order.joins(order_details: :order_technique_details)
                           .where(order_details: { factory_id: 8 })
                           .where(order_technique_details: { technique_id: 6 })
                           .where(order_technique_details: { progress_id: [3,4,5,6,7]  })
                           .group("orders.internal_delivery_date")
                           .count

    #縫製の美女木の見積もり済み指示書の未製作件数🐤
    @sewing_bijogi_pasteup_wip = Order.joins(order_details: :order_technique_details)
                             .where(order_details: { factory_id: 8 })
                             .where(order_technique_details: { technique_id: 6 })
                             .where(order_technique_details: { progress_id: 1  })
                             .group("orders.internal_delivery_date")
                             .count

    #縫製の美女木の指示書作成済み🐔
    @sewing_bijogi_done = Order.joins(order_details: :order_technique_details)
                           .where(order_details: { factory_id: 8 })
                           .where(order_technique_details: { technique_id: 6 })
                           .where(order_technique_details: { progress_id: [3,4,5,6,7]  })
                           .group("orders.internal_delivery_date")
                           .count

    #シルクスクリーンBの未製作件数
    @silkscreen_b_wip = Order.joins(order_details: :order_technique_details)
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

    #シルクスクリーンBの指示書作成済み🐔
    @silkscreen_b_done = Order.joins(order_details: :order_technique_details)
                           .where(order_technique_details: { technique_id: 2 })
                           .where(order_technique_details: { progress_id: [3,4,5,6,7]  })
                           .group("orders.internal_delivery_date")
                           .count

    #シルクスクリーンCの未製作件数
    @silkscreen_c_wip = Order.joins(order_details: :order_technique_details)
                          .where(order_technique_details: { technique_id: 3 })
                          .where.not(order_technique_details: { progress_id: 7  })
                          .group("orders.internal_delivery_date")
                          .count

    #シルクスクリーンCの見積もり済み指示書の未製作件数🐤
    @silkscreen_c_pasteup_wip = Order.joins(order_details: :order_technique_details)
                          .where(order_technique_details: { technique_id: 3 })
                          .where(order_technique_details: { progress_id: 1  })
                          .group("orders.internal_delivery_date")
                          .count

    #シルクスクリーンCの指示書作成済み🐔
    @silkscreen_c_done = Order.joins(order_details: :order_technique_details)
                           .where(order_technique_details: { technique_id: 3 })
                           .where(order_technique_details: { progress_id: [3,4,5,6,7]  })
                           .group("orders.internal_delivery_date")
                           .count

    #シルクスクリーンD未製作
    @silkscreen_d_wip = Order.joins(order_details: :order_technique_details)
                          .where(order_technique_details: { technique_id: 8 })
                          .where.not(order_technique_details: { progress_id: 7  })
                          .group("orders.internal_delivery_date")
                          .count

    #シルクスクリーンDの見積もり済み指示書の未製作件数🐤
    @silkscreen_d_pasteup_wip = Order.joins(order_details: :order_technique_details)
                          .where(order_technique_details: { technique_id: 8 })
                          .where(order_technique_details: { progress_id: 1  })
                          .group("orders.internal_delivery_date")
                          .count

    #シルクスクリーンDの指示書作成済み🐔
    @silkscreen_d_done = Order.joins(order_details: :order_technique_details)
                          .where(order_technique_details: { technique_id: 8 })
                          .where(order_technique_details: { progress_id: [3,4,5,6,7]  })
                          .group("orders.internal_delivery_date")
                          .count

    #加工なし戸田1指示書未作成🐤
    @blank_toda1_wip = Order.joins(order_details: :order_technique_details)
                          .where(order_details: { factory_id: 4 })
                          .where(order_technique_details: { technique_id: 9 })
                          .where.not(order_technique_details: { progress_id: 7  })
                          .group("orders.internal_delivery_date")
                          .count

    #加工なし戸田1指示書作成済み🐔
    @blank_toda1_done = Order.joins(order_details: :order_technique_details)
                           .where(order_details: { factory_id: 4 })
                           .where(order_technique_details: { technique_id: 9 })
                           .where(order_technique_details: { progress_id: [3,4,5,6,7]  })
                           .group("orders.internal_delivery_date")
                           .count

    #加工なし美女木指示書未作成🐤
    @blank_bijogi_wip = Order.joins(order_details: :order_technique_details)
                         .where(order_details: { factory_id: 8 })
                         .where(order_technique_details: { technique_id: 9 })
                         .where.not(order_technique_details: { progress_id: 7  })
                         .group("orders.internal_delivery_date")
                         .count

    #加工なし美女木指示書作成済み🐔
    @blank_bijogi_done = Order.joins(order_details: :order_technique_details)
                          .where(order_details: { factory_id: 8 })
                          .where(order_technique_details: { technique_id: 9 })
                          .where(order_technique_details: { progress_id: [3,4,5,6,7]  })
                          .group("orders.internal_delivery_date")
                          .count

    #加工なし代々木指示書未作成
    @blank_yoyogi_wip = Order.joins(order_details: :order_technique_details)
                          .where(order_details: { factory_id: 7 })
                          .where(order_technique_details: { technique_id: 9 })
                          .where.not(order_technique_details: { progress_id: 7  })
                          .group("orders.internal_delivery_date")
                          .count

    #加工なし代々木指示書作成済み🐔
    @blank_yoyogi_done = Order.joins(order_details: :order_technique_details)
                           .where(order_details: { factory_id: 7 })
                           .where(order_technique_details: { technique_id: 9 })
                           .where(order_technique_details: { progress_id: [3,4,5,6,7]  })
                           .group("orders.internal_delivery_date")
                           .count

    #UV 未製作
    @uv_wip = Order.joins(order_details: :order_technique_details)
                .where(order_technique_details: { technique_id: 7 })
                .where.not(order_technique_details: { progress_id: 7  })
                .group("orders.internal_delivery_date")
                .count

    #UVの見積もり済み指示書の未製作件数🐤
    @uv_pasteup_wip = Order.joins(order_details: :order_technique_details)
                .where(order_technique_details: { technique_id: 7 })
                .where(order_technique_details: { progress_id: 1  })
                .group("orders.internal_delivery_date")
                .count

    #UVの指示書作成済み🐔
    @uv_done = Order.joins(order_details: :order_technique_details)
                 .where(order_technique_details: { technique_id: 7 })
                 .where(order_technique_details: { progress_id: [3,4,5,6,7]  })
                 .group("orders.internal_delivery_date")
                 .count
  end

  # def wip
  #   @date = params[:date]
  #   @orders = Order.left_joins(order_details: :order_technique_details).distinct
  #               .where(order_technique_details: { technique_id: 1 }).distinct
  #               .where.not(order_technique_details: { progress_id: 1 })
  #               .where(orders: { internal_delivery_date: @date.to_date }).distinct
  #               .order(:internal_delivery_date)
  # end
  #
  # def done
  #   @date = params[:date]
  #   @orders = Order.left_joins(order_details: :order_technique_details).distinct
  #               .where(order_technique_details: { technique_id: 1 }).distinct
  #               .where(order_technique_details: { progress_id: 1 })
  #               .where(orders: { internal_delivery_date: @date.to_date }).distinct
  #               .order(:internal_delivery_date)
  # end

  private
  def order_params
    params
      .require(:order)
      .permit(
        :id, :uid, :customer_id,
        :order_reflect_user_id, :representative_user_id,
        :order_type_id, :quote_difficulty_level_id, :payment_method_id,
        :order_date, :first_response_date, :desired_delivery_date, :desired_delivery_type_id, :internal_delivery_date,
        :specified_time_id, :change_delivery_date,
        :domestic_buying, :overseas_buying, :carry_in,
        :payment_deadline_date, :payment_amount, :payment_confirmation,
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
