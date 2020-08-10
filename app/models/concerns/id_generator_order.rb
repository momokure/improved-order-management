module IdGeneratorOrder

  def self.included(uid)
    if uid.blank?
      uid.before_create :generate_uid
    end
  end

  def generate_uid
    self.uid = loop do
      uid = 'CP' + [*0..9, *'A'..'Z'].sample(14)*''
      break uid unless self.class.exists?(uid: uid)
    end
  end
end