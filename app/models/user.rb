class User < ApplicationRecord
  has_many :authentications, dependent: :destroy
  has_many :bids, dependent: :destroy
  has_many :boards, dependent: :destroy
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
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
