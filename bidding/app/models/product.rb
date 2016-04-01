class Product < ApplicationRecord
  validates :name, presence: true
  validates :photo, presence: true
  validates :price, presence: true
end