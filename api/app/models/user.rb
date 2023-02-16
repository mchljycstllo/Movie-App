# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models
  mount_uploader :image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User



  has_many :comments, through: :movies
  has_many :favorites, through: :movies

  validates :email, presence: true, uniqueness: true
  validates :image, presence: true, on: :create
end
