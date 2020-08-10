module IdGeneratorCustomer

  def self.included(uid)
    uid.before_create :generate_uid
  end

  def generate_uid
    self.uid = loop do
      uid = 'CU' + [*0..9, *'A'..'Z'].sample(14)*''
      break uid unless self.class.exists?(uid: uid)
    end
  end

end