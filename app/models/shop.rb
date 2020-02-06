class Shop < ApplicationRecord
  has_many :products
  belongs_to :producer


  attachment :shop_image
end
