class Accounting::ForRepresentativeController < ApplicationController
  require "date"

  def index
    @orders = Order.left_joins(:payments).distinct
                .where(orders: { order_type_id: 1 }).distinct
                .where(payments: { order_id: nil }).distinct
                .order(Arel.sql('internal_delivery_date IS NULL, internal_delivery_date ASC'))
                .order(Arel.sql('payment_deadline_date IS NULL, payment_deadline_date ASC'))

  end

  #ご入金予定額 - (すべてのご入金額) = 過不足額
  # 　0 == ご入金済、0 > 不足、1=< 超過


  # difference(差額)カラムを作成
  # カラムには下記が 自動で更新されるようにする
  # ご入金額(amount_paid) - 入金予定額(payment_amount)


  ## フィルタ
  # ①customer_typeが 前払い(請求書不要)
  # ②ご入金 (Payment) がない
  # 　→基本的に不備・後納は除外する
  # 　→ただし、不備・後納でもご入金が発生する場合は 含まれる

  # ③ご入金 (Payment) があっても 不足金がある

  # ④ご入金 (Payment) があっても 超過金がある

  ## 並び順
  # 不備・後納は基本的に除外する (例外あり)
  # 基本は納品日順 (過不足→明日出荷予定の順で表示する)
  # *請求書払いのお客様は表示しない(別シートで管理する)

  # 請求書払いを登録する
  # あと何日！を表示
end