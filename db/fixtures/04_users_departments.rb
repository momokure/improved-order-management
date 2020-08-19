UsersDepartment.seed do |s|
  s.id = 1
  s.user_id = User.find_by(user_name: "花原 史樹").id
  s.department_id = Department.find_by(department_name: "インフラ(システム管理)").id
  s.position_id = Position.find_by(position_name: "社員").id
end

UsersDepartment.seed do |s|
  s.id = 2
  s.user_id = User.find_by(user_name: "担当者なし").id
  s.department_id = Department.find_by(department_name: "該当なし").id
  s.position_id = Position.find_by(position_name: "社員").id
end