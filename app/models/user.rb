class User < ApplicationRecord
  has_many :authentications
  has_many :bids
  has_many :boards
  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest) == password
  end


  def self.create_with_auth_and_hash(authentication, auth_hash)
    user = self.create!(
      first_name: auth_hash["info"]["first_name"],
      last_name: auth_hash["info"]["last_name"],
      email: auth_hash["info"]["email"]
    )
    user.authentications << authentication
    return user
  end

 # grab fb_token to access Facebook for user data
  def google_token
    x = self.authentications.find_by(provider: 'google')
    return x.token unless x.nil?
  end

end
