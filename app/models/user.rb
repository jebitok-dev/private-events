class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events

  before_create :remember_value

def valid_password?(password)
    if password.blank?
        true
    else
        super
    end
end

def password_required?
    new_record? ? false : super
end

def remember_value
    self.remember_token ||= Devise.friendly_token
end
end
