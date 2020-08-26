UsersFactory.seed do |s|
  s.id = 1
  s.user_id = User.find_by(user_name: "花原 史樹").id
  s.factory_id = 1
end

UsersFactory.seed do |s|
  s.id = 2
  s.user_id = User.find_by(user_name: "担当者なし").id
  s.factory_id = 1
end