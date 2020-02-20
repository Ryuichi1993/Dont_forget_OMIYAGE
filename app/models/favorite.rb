class Favorite < ApplicationRecord
  belongs_to :end_user
  belongs_to :product

  validates :end_user_id, {presence: true}
  validates :product_id, {presence: true}
end
