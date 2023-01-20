class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  acts_as_token_authenticatable
  
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  validates :email, presence: true
  validates :username, presence: true
  validates :password, presence: true
end
