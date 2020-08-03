PaymentMethod.seed do |s|
  s.id = 1
  s.payment_method_name = "前払い (請求書不要)"
  s.payment_condition = "前払い"
  s.invoice_required = 0
end

PaymentMethod.seed do |s|
  s.id = 2
  s.payment_method_name = "前払い (要請求書)"
  s.payment_condition = "前払い"
  s.invoice_required = 1
end

PaymentMethod.seed do |s|
  s.id = 3
  s.payment_method_name = "後払い (要請求書)"
  s.payment_condition = "後払い (要請求書)"
  s.invoice_required = 1
end

PaymentMethod.seed do |s|
  s.id = 4
  s.payment_method_name = "後払い (請求書不要)"
  s.payment_condition = "後払い"
  s.invoice_required = 0
end