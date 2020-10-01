class Pasteup::CalendarController < ApplicationController
  require 'date'

  def index
    @start = Date.today.last_month.prev_occurring(:sunday)
    @end = @start.next_month.next_month.end_of_week

    #シルクスクリーンA戸田公園第1の未制作件数
    @silkscreen_a_toda1_priority = Order.joins(order_details: :order_technique_details)
                                     .where(order_details: { factory_id: 4 })
                                     .where(order_technique_details: { technique_id: 1 })
                                     .where(order_technique_details: { progress_id: 2 })
                                     .group("orders.internal_delivery_date")
                                     .count

    @silkscreen_a_toda1_wip = Order.joins(order_details: :order_technique_details)
                                .where(order_details: { factory_id: 4 })
                                .where(order_technique_details: { technique_id: 1 })
                                .where.not(order_technique_details: { progress_id: [4, 5, 6, 7] })
                                .group("orders.internal_delivery_date")
                                .count

    #シルクスクリーンA戸田公園第1の制作済の件数
    @silkscreen_a_toda1_done = Order.joins(order_details: :order_technique_details)
                                .where(order_details: { factory_id: 4 })
                                .where(order_technique_details: { technique_id: 1 })
                                .where(order_technique_details: { progress_id: [4, 5, 6, 7] })
                                .group("orders.internal_delivery_date")
                                .count

    #シルクスクリーンA美女木の未制作の件数
    @silkscreen_a_bijogi_priority = Order.joins(order_details: :order_technique_details)
                                 .where(order_details: { factory_id: 8 })
                                 .where(order_technique_details: { technique_id: 1 })
                                 .where(order_technique_details: { progress_id: 2 })
                                 .group("orders.internal_delivery_date")
                                 .count

    @silkscreen_a_bijogi_wip = Order.joins(order_details: :order_technique_details)
                                 .where(order_details: { factory_id: 8 })
                                 .where(order_technique_details: { technique_id: 1 })
                                 .where.not(order_technique_details: { progress_id: [4, 5, 6, 7] })
                                 .group("orders.internal_delivery_date")
                                 .count

    #シルクスクリーンA美女木の制作済件数
    @silkscreen_a_bijogi_done = Order.joins(order_details: :order_technique_details)
                                 .where(order_details: { factory_id: 8 })
                                 .where(order_technique_details: { technique_id: 1 })
                                 .where(order_technique_details: { progress_id: [4, 5, 6, 7] })
                                 .group("orders.internal_delivery_date")
                                 .count

    #インクジェットの戸田公園第1の未制作件数
    @inkjet_toda1_priority = Order.joins(order_details: :order_technique_details)
                                      .where(order_details: { factory_id: 4 })
                                      .where(order_technique_details: { technique_id: 4 })
                                      .where(order_technique_details: { progress_id: 2 })
                                      .group("orders.internal_delivery_date")
                                      .count

    @inkjet_toda1_wip = Order.joins(order_details: :order_technique_details)
                          .where(order_details: { factory_id: 4 })
                          .where(order_technique_details: { technique_id: 4 })
                          .where.not(order_technique_details: { progress_id: [4, 5, 6, 7] })
                          .group("orders.internal_delivery_date")
                          .count

    #インクジェットの戸田公園第一の制作済件数
    @inkjet_toda1_done = Order.joins(order_details: :order_technique_details)
                          .where(order_details: { factory_id: 4 })
                          .where(order_technique_details: { technique_id: 4 })
                          .where(order_technique_details: { progress_id: [4, 5, 6, 7] })
                          .group("orders.internal_delivery_date")
                          .count

    #インクジェットの美女木の未制作件数
    @inkjet_bijogi_priority = Order.joins(order_details: :order_technique_details)
                               .where(order_details: { factory_id: 8 })
                               .where(order_technique_details: { technique_id: 4 })
                               .where(order_technique_details: { progress_id: 2 })
                               .group("orders.internal_delivery_date")
                               .count

    @inkjet_bijogi_wip = Order.joins(order_details: :order_technique_details)
                           .where(order_details: { factory_id: 8 })
                           .where(order_technique_details: { technique_id: 4 })
                           .where.not(order_technique_details: { progress_id: [4, 5, 6, 7] })
                           .group("orders.internal_delivery_date")
                           .count

    #インクジェットの美女木の制作済件数
    @inkjet_bijogi_done = Order.joins(order_details: :order_technique_details)
                           .where(order_details: { factory_id: 8 })
                           .where(order_technique_details: { technique_id: 4 })
                           .where(order_technique_details: { progress_id: [4, 5, 6, 7] })
                           .group("orders.internal_delivery_date")
                           .count

    #刺繍の戸田公園第1の未制作件数
    @embroidery_toda1_priority = Order.joins(order_details: :order_technique_details)
                                .where(order_details: { factory_id: 4 })
                                .where(order_technique_details: { technique_id: 5 })
                                .where(order_technique_details: { progress_id: 2 })
                                .group("orders.internal_delivery_date")
                                .count

    @embroidery_toda1_wip = Order.joins(order_details: :order_technique_details)
                              .where(order_details: { factory_id: 4 })
                              .where(order_technique_details: { technique_id: 5 })
                              .where.not(order_technique_details: { progress_id: [4, 5, 6, 7] })
                              .group("orders.internal_delivery_date")
                              .count

    #刺繍の戸田公園第1の制作済件数
    @embroidery_toda1_done = Order.joins(order_details: :order_technique_details)
                              .where(order_details: { factory_id: 4 })
                              .where(order_technique_details: { technique_id: 5 })
                              .where(order_technique_details: { progress_id: [4, 5, 6, 7] })
                              .group("orders.internal_delivery_date")
                              .count

    #刺繍の美女木の未制作件数
    @embroidery_bijogi_priority = Order.joins(order_details: :order_technique_details)
                                   .where(order_details: { factory_id: 8 })
                                   .where(order_technique_details: { technique_id: 5 })
                                   .where(order_technique_details: { progress_id: 2 })
                                   .group("orders.internal_delivery_date")
                                   .count

    @embroidery_bijogi_wip = Order.joins(order_details: :order_technique_details)
                               .where(order_details: { factory_id: 8 })
                               .where(order_technique_details: { technique_id: 5 })
                               .where.not(order_technique_details: { progress_id: [4, 5, 6, 7] })
                               .group("orders.internal_delivery_date")
                               .count

    #刺繍の美女木の制作済件数
    @embroidery_bijogi_done = Order.joins(order_details: :order_technique_details)
                               .where(order_details: { factory_id: 8 })
                               .where(order_technique_details: { technique_id: 5 })
                               .where(order_technique_details: { progress_id: [4, 5, 6, 7] })
                               .group("orders.internal_delivery_date")
                               .count

    #縫製の戸田公園第1の未制作件数
    @sewing_toda1_priority = Order.joins(order_details: :order_technique_details)
                                    .where(order_details: { factory_id: 4 })
                                    .where(order_technique_details: { technique_id: 6 })
                                    .where(order_technique_details: { progress_id: 2 })
                                    .group("orders.internal_delivery_date")
                                    .count

    @sewing_toda1_wip = Order.joins(order_details: :order_technique_details)
                          .where(order_details: { factory_id: 4 })
                          .where(order_technique_details: { technique_id: 6 })
                          .where.not(order_technique_details: { progress_id: [4, 5, 6, 7] })
                          .group("orders.internal_delivery_date")
                          .count

    #縫製の戸田公園第1の制作済件数
    @sewing_toda1_done = Order.joins(order_details: :order_technique_details)
                           .where(order_details: { factory_id: 4 })
                           .where(order_technique_details: { technique_id: 6 })
                           .where(order_technique_details: { progress_id: [4, 5, 6, 7] })
                           .group("orders.internal_delivery_date")
                           .count

    #縫製の美女木の未制作件数
    @sewing_bijogi_priority = Order.joins(order_details: :order_technique_details)
                               .where(order_details: { factory_id: 8 })
                               .where(order_technique_details: { technique_id: 6 })
                               .where(order_technique_details: { progress_id: 2 })
                               .group("orders.internal_delivery_date")
                               .count

    @sewing_bijogi_wip = Order.joins(order_details: :order_technique_details)
                           .where(order_details: { factory_id: 8 })
                           .where(order_technique_details: { technique_id: 6 })
                           .where.not(order_technique_details: { progress_id: [4, 5, 6, 7] })
                           .group("orders.internal_delivery_date")
                           .count

    #縫製の美女木の制作済件数
    @sewing_bijogi_done = Order.joins(order_details: :order_technique_details)
                           .where(order_details: { factory_id: 8 })
                           .where(order_technique_details: { technique_id: 6 })
                           .where(order_technique_details: { progress_id: [4, 5, 6, 7] })
                           .group("orders.internal_delivery_date")
                           .count

    #シルクスクリーンBの未制作件数
    @silkscreen_b_priority = Order.joins(order_details: :order_technique_details)
                                .where(order_technique_details: { technique_id: 2 })
                                .where(order_technique_details: { progress_id: 2 })
                                .group("orders.internal_delivery_date")
                                .count

    @silkscreen_b_wip = Order.joins(order_details: :order_technique_details)
                          .where(order_technique_details: { technique_id: 2 })
                          .where.not(order_technique_details: { progress_id: [4, 5, 6, 7] })
                          .group("orders.internal_delivery_date")
                          .count

    #シルクスクリーンBの制作済件数
    @silkscreen_b_done = Order.joins(order_details: :order_technique_details)
                           .where(order_technique_details: { technique_id: 2 })
                           .where(order_technique_details: { progress_id: [4, 5, 6, 7] })
                           .group("orders.internal_delivery_date")
                           .count

    #シルクスクリーンCの未制作件数
    @silkscreen_c_priority = Order.joins(order_details: :order_technique_details)
                               .where(order_technique_details: { technique_id: 3 })
                               .where(order_technique_details: { progress_id: 2 })
                               .group("orders.internal_delivery_date")
                               .count

    @silkscreen_c_wip = Order.joins(order_details: :order_technique_details)
                          .where(order_technique_details: { technique_id: 3 })
                          .where.not(order_technique_details: { progress_id: [4, 5, 6, 7] })
                          .group("orders.internal_delivery_date")
                          .count

    #シルクスクリーンCの制作済件数
    @silkscreen_c_done = Order.joins(order_details: :order_technique_details)
                           .where(order_technique_details: { technique_id: 3 })
                           .where(order_technique_details: { progress_id: [4, 5, 6, 7] })
                           .group("orders.internal_delivery_date")
                           .count

    @silkscreen_d_priority = Order.joins(order_details: :order_technique_details)
                               .where(order_technique_details: { technique_id: 8 })
                               .where(order_technique_details: { progress_id: 2 })
                               .group("orders.internal_delivery_date")
                               .count

    @silkscreen_d_wip = Order.joins(order_details: :order_technique_details)
                          .where(order_technique_details: { technique_id: 8 })
                          .where.not(order_technique_details: { progress_id: [4, 5, 6, 7]})
                          .group("orders.internal_delivery_date")
                          .count

    #シルクスクリーンDの制作済件数
    @silkscreen_d_done = Order.joins(order_details: :order_technique_details)
                          .where(order_technique_details: { technique_id: 8 })
                          .where(order_technique_details: { progress_id: [4, 5, 6, 7]})
                          .group("orders.internal_delivery_date")
                          .count

    @silkscreen_d_cassette = Order.joins(order_details: :order_technique_detail_options)
                               .where(order_technique_detail_options: { technique_option_id: 5 })
                               .group("orders.internal_delivery_date")
                               .count

    #加工なし戸田1指示書未作成🐤
    @blank_toda1_priority = Order.joins(order_details: :order_technique_details)
                              .where(order_details: { factory_id: 4 })
                              .where(order_technique_details: { technique_id: 9 })
                              .where(order_technique_details: { progress_id: 2 })
                              .group("orders.internal_delivery_date")
                              .count

    @blank_toda1_wip = Order.joins(order_details: :order_technique_details)
                          .where(order_details: { factory_id: 4 })
                          .where(order_technique_details: { technique_id: 9 })
                          .where.not(order_technique_details: { progress_id: [4, 5, 6, 7] })
                          .group("orders.internal_delivery_date")
                          .count

    #加工なし戸田1指示書作成済
    @blank_toda1_done = Order.joins(order_details: :order_technique_details)
                           .where(order_details: { factory_id: 4 })
                           .where(order_technique_details: { technique_id: 9 })
                           .where(order_technique_details: { progress_id: [4, 5, 6, 7] })
                           .group("orders.internal_delivery_date")
                           .count

    #加工なし美女木指示書未作成🐤
    @blank_bijogi_priority = Order.joins(order_details: :order_technique_details)
                              .where(order_details: { factory_id: 8 })
                              .where(order_technique_details: { technique_id: 9 })
                              .where(order_technique_details: { progress_id: 2 })
                              .group("orders.internal_delivery_date")
                              .count

    @blank_bijogi_wip = Order.joins(order_details: :order_technique_details)
                         .where(order_details: { factory_id: 8 })
                         .where(order_technique_details: { technique_id: 9 })
                         .where.not(order_technique_details: { progress_id: [4, 5, 6, 7] })
                         .group("orders.internal_delivery_date")
                         .count

    #加工なし美女木指示書作成済
    @blank_bijogi_done = Order.joins(order_details: :order_technique_details)
                          .where(order_details: { factory_id: 8 })
                          .where(order_technique_details: { technique_id: 9 })
                          .where(order_technique_details: { progress_id: [4, 5, 6, 7] })
                          .group("orders.internal_delivery_date")
                          .count

    #加工なし代々木指示書未作成
    @blank_yoyogi_priority = Order.joins(order_details: :order_technique_details)
                               .where(order_details: { factory_id: 7 })
                               .where(order_technique_details: { technique_id: 9 })
                               .where(order_technique_details: { progress_id: 2 })
                               .group("orders.internal_delivery_date")
                               .count

    @blank_yoyogi_wip = Order.joins(order_details: :order_technique_details)
                          .where(order_details: { factory_id: 7 })
                          .where(order_technique_details: { technique_id: 9 })
                          .where.not(order_technique_details: { progress_id: [4, 5, 6, 7] })
                          .group("orders.internal_delivery_date")
                          .count

    #加工なし代々木指示書作成済
    @blank_yoyogi_done = Order.joins(order_details: :order_technique_details)
                           .where(order_details: { factory_id: 7 })
                           .where(order_technique_details: { technique_id: 9 })
                           .where(order_technique_details: { progress_id: [4, 5, 6, 7] })
                           .group("orders.internal_delivery_date")
                           .count

    @uv_priority = Order.joins(order_details: :order_technique_details)
                               .where(order_technique_details: { technique_id: 7 })
                               .where(order_technique_details: { progress_id: 2 })
                               .group("orders.internal_delivery_date")
                               .count

    @uv_wip = Order.joins(order_details: :order_technique_details)
                .where(order_technique_details: { technique_id: 7 })
                .where.not(order_technique_details: { progress_id: [4, 5, 6, 7] })
                .group("orders.internal_delivery_date")
                .count

    #UVの制作済件数
    @uv_done = Order.joins(order_details: :order_technique_details)
                 .where(order_technique_details: { technique_id: 7 })
                 .where(order_technique_details: { progress_id: [4, 5, 6, 7] })
                 .group("orders.internal_delivery_date")
                 .count
  end
end
