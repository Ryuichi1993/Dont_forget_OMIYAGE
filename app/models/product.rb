class Product < ApplicationRecord
  belongs_to :shop
  belongs_to :producer

  has_many   :products
  has_many   :product_comments
  has_many   :favorites

  attachment :product_image





end
