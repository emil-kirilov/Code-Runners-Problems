class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validates :amount, presence: true
  validates :unit, presence: true
  validates :user_id, presence: true
  validates :product_id, presence: true
end