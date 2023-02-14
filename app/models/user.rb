class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  # Associations
  has_many :foods, dependent: :destroy

  # Validation
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
end
