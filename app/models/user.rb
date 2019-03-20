class User < ApplicationRecord
  has_many :seminartopic,dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:login]

  attr_writer :login

  def login
    @login || self.username || self.email
  end

  validates :username, presence: :true, uniqueness: { case_sensitive: false }

  def self.find_for_database_authentication(warden_conditions)
        conditions = warden_conditions.dup
        if login = conditions.delete(:login)
          where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value",
             { :value => login.downcase }]).first
        elsif conditions.has_key?(:username) || conditions.has_key?(:email)
          where(conditions.to_h).first
        end
  end
end
