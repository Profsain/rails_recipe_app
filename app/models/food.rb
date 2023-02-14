class Food < ApplicationRecord
  # Associations
  belongs_to :user

  # Validation
  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
end
