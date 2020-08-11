User.seed do |s|
  s.id = 1
  s.user_name = "担当者なし"
  s.email = "nouser@cornerprinting.com"
  s.password = "cp201405"
  s.password_confirmation = "cp201405"
end

User.seed do |s|
  s.id = 2
  s.user_name = "花原史樹"
  s.email = "hanahara@cornerprinting.com"
  s.password = "cp201405"
  s.password_confirmation = "cp201405"
end
