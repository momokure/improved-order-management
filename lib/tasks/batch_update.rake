namespace :batch_update do
  desc "お支払い方法の変更"
  task payment_method_id: :environment do
    Order.all.each do |order|
      customer = Customer.find(order.customer_id)
      customer_payment_method_id = customer.payment_method_id
      order.payment_method_id = customer_payment_method_id
      order.save
    end
  end
end
