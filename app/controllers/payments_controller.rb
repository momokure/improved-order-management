class PaymentsController < ApplicationController
  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.save!

    redirect_to accounting_backlog_index_path
  end

  private
  def payment_params
    params
      .require(:payment)
      .permit(
        :id, :payment_date, :amount_paid, :accounting_user_id, :order_id
      )
  end
end
