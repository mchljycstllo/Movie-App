class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  acts_as_token_authenticatable
  
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: false
  validates :username, presence: true, uniqueness: false
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true
  validates :role, presence: true
end
