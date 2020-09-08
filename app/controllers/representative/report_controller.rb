class Representative::ReportController < ApplicationController
  require 'date'

  def index
    @year_month = params[:year_month]
    @year_month_beginning = @year_month.to_s+"-01"
    @year_month_beginning = @year_month_beginning.to_date
    @end = @year_month_beginning.next_month-1

    @period = (Date.parse("#{@year_month_beginning}")..Date.parse("#{@end}"))

    @mizukami_number = Order.where(representative_user_id: 6).distinct
                             .where(order_type_id: [1, 2]).distinct
                             .group(:first_response_date)
                             .count

    @fukudome_number = Order.where(representative_user_id: 7).distinct
                             .where(order_type_id: [1, 2]).distinct
                             .group(:first_response_date)
                             .count

    @yagyu_number = Order.where(representative_user_id: 20).distinct
                             .where(order_type_id: [1, 2]).distinct
                             .group(:first_response_date)
                             .count

    @sato_number = Order.where(representative_user_id: 3).distinct
                          .where(order_type_id: [1, 2]).distinct
                          .group(:first_response_date)
                          .count

    @yaginuma_number = Order.where(representative_user_id: 19).distinct
                         .where(order_type_id: [1, 2]).distinct
                         .group(:first_response_date)
                         .count

    @shinonome_number = Order.where(representative_user_id: 17).distinct
                             .where(order_type_id: [1, 2]).distinct
                             .group(:first_response_date)
                             .count

    @anazawa_number = Order.where(representative_user_id: 8).distinct
                              .where(order_type_id: [1, 2]).distinct
                              .group(:first_response_date)
                              .count

    @takeuchi_number = Order.where(representative_user_id: 18).distinct
                            .where(order_type_id: [1, 2]).distinct
                            .group(:first_response_date)
                            .count

    @sakaguchi_number = Order.where(representative_user_id: 12).distinct
                             .where(order_type_id: [1, 2]).distinct
                             .group(:first_response_date)
                             .count

    @kanno_number = Order.where(representative_user_id: 24).distinct
                              .where(order_type_id: [1, 2]).distinct
                              .group(:first_response_date)
                              .count

    @matsutomo_number = Order.where(representative_user_id: 13).distinct
                          .where(order_type_id: [1, 2]).distinct
                          .group(:first_response_date)
                          .count

    @yabe_number = Order.where(representative_user_id: 10).distinct
                          .where(order_type_id: [1, 2]).distinct
                          .group(:first_response_date)
                          .count

    @tateishi_number = Order.where(representative_user_id: 15).distinct
                         .where(order_type_id: [1, 2]).distinct
                         .group(:first_response_date)
                         .count

    @kato_number = Order.where(representative_user_id: 14).distinct
                             .where(order_type_id: [1, 2]).distinct
                             .group(:first_response_date)
                             .count

    @sogabe_number = Order.where(representative_user_id: 9).distinct
                         .where(order_type_id: [1, 2]).distinct
                         .group(:first_response_date)
                         .count

    @ichijo_number = Order.where(representative_user_id: 23).distinct
                       .where(order_type_id: [1, 2]).distinct
                       .group(:first_response_date)
                       .count

    @kodaira_number = Order.where(representative_user_id: 21).distinct
                       .where(order_type_id: [1, 2]).distinct
                       .group(:first_response_date)
                       .count

    @ukita_number = Order.where(representative_user_id: 11).distinct
                       .where(order_type_id: [1, 2]).distinct
                       .group(:first_response_date)
                       .count

    @mogami_number = Order.where(representative_user_id: 22).distinct
                       .where(order_type_id: [1, 2]).distinct
                       .group(:first_response_date)
                       .count

    @matsuura_number = Order.where(representative_user_id: 16).distinct
                       .where(order_type_id: [1, 2]).distinct
                       .group(:first_response_date)
                       .count

    @dannoura_number = Order.where(representative_user_id: 81).distinct
                         .where(order_type_id: [1, 2]).distinct
                         .group(:first_response_date)
                         .count
  end
end