class Product < ApplicationRecord
  validates :name, presence: true, length: { minimum: 5, maximum: 35 }
  validates :price, presence: true, numericality: true
  validates :photo_url, presence: true
end
