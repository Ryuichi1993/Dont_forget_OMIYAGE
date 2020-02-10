class Product < ApplicationRecord
  belongs_to :shop
  belongs_to :producer

  has_many   :product_comments, dependent: :destroy
  has_many   :favorites, dependent: :destroy

  attachment :product_image


 def favorite_end_user(end_user)
 	favorites.where(end_user_id: end_user.id).exists?
 end
end
