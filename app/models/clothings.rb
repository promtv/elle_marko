class Clothings < ApplicationRecord
 validates :classification, presence: true
 validates :brand, presence: true
 validates :name, presence: true
 validates :price, numericality: { greater_than_or_equal_to: 0 }
 validates :material, presence: true
 validates :size, presence: true
 validates :for_whom, presence: true
end
