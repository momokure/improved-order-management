PaymentMethod.seed do |s|
  s.id = 1
  s.payment_conditions = "前払い"
  s.invoice_required = "不要"
end

PaymentMethod.seed do |s|
  s.id = 2
  s.payment_conditions = "前払い"
  s.invoice_required = "必要"
end

PaymentMethod.seed do |s|
  s.id = 3
  s.payment_conditions = "後払い"
  s.invoice_required = "不要"
end

PaymentMethod.seed do |s|
  s.id = 4
  s.payment_conditions = "後払い"
  s.invoice_required = "必要"
end