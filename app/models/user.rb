class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews

  validates_format_of :email,:with => /\A[\s]*[^@\s]+@([^@\s]+\.)+[^@\s]+[\s]*\z/

  validates :password, length: {minimum: 6}

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true


  def self.authenticate_with_credentials(email, password)
    user = User.where(:email => email).first
    if user && user.authenticate(email,password)
      return user
    else
      return nil
    end
  end
end
