class Inventory < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :inventory_foods, dependent: :destroy
  has_many :foods, through: :inventory_foods

  validates :name, presence: true
end
