InvoicingDepartment.seed do |s|
  s.id = 1
  s.payment_method_id = 2
  s.department_id = Department.find_by(department_name: "営業").id
end

InvoicingDepartment.seed do |s|
  s.id = 2
  s.payment_method_id = 4
  s.department_id = Department.find_by(department_name: "経理").id
end