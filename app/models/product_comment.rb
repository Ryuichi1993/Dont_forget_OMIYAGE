class ProductComment < ApplicationRecord
  belongs_to :end_user
  belongs_to :product

  validates  :comment, presence:true
end
