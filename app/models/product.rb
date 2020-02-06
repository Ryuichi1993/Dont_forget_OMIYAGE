class Product < ApplicationRecord
  belongs_to :shop
  belongs_to :producer
  attachment :product_image
end
