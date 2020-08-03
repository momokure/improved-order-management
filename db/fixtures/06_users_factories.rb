UsersFactory.seed do |s|
  s.id = 1
  s.user_id = User.find_by(user_name: "花原史樹").id
  s.factory_id = Factory.find_by(factory_name: "リモート").id
end