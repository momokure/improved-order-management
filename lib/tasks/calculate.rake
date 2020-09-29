namespace :calculate do
  desc "差額計算"
  task difference: :environment do
    Order.all.each do |order|
      amount_paid = Payment.where(order_id: order.id).sum(:amount_paid)
      if Payment.where(order_id: order.id).present? && order.payment_amount.present?
        order.difference = amount_paid - order.payment_amount
        order.save
      elsif Payment.where(order_id: order.id).present? && order.payment_amount.nil?
        order.difference = amount_paid
        order.save
      elsif Payment.where(order_id: order.id).nil? && order.payment_amount.present?
        order.difference = order.payment_amount * -1
        order.save
      end
    end
  end
end
