class Accounting::ForRepresentativeController < ApplicationController
  require "date"

  def index
    @orders = Order.left_joins(:payments).distinct
                .where.not(orders: { difference: 0 }).distinct
                .order(Arel.sql('internal_delivery_date IS NULL, internal_delivery_date ASC'))
                .order(Arel.sql('payment_deadline_date IS NULL, payment_deadline_date ASC'))

  end

  #(すべてのご入金額 : amount_paid) - ご入金予定額(payment_amount) = 過不足額
  # 　0 == ご入金済、0 > 不足、1=< 超過

  # difference(差額)カラムを作成
  # カラムには下記が amount_paidが更新される度に 自動で実行されるようにする
  # ご入金額(amount_paid) - ご入金予定額(payment_amount)
  # ↓
  # やること
  # 差額(difference)のデフォルト値は ご入金予定額(payment_amount) が入る様にする
  # ご入金額(amount_paid) を登録する度に [ご入金額(amount_paid) - ご入金予定額(payment_amount)] の式が実行される
  # (不備・後納等の空欄は?)
  # 差額カラムのみ表示するようにする

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