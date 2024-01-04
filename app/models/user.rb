# User model
class User < ApplicationRecord
  enum role: { regular: 0, admin: 1 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :trackable

  has_many :posts, dependent: :destroy_async

  validates :email, presence: { uniqueness: true }
  validates :encrypted_password, presence: true
end
