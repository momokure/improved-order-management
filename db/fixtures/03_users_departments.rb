UsersDepartment.seed do |s|
  s.id = 1
  s.user_id = User.find_by(user_name: "花原史樹").id
  s.department_id = Department.find_by(department_name: "システム管理").id
end