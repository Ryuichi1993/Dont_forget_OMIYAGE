class Product < ApplicationRecord
	belongs_to :shop
	belongs_to :producer

	has_many   :product_comments, dependent: :destroy
	has_many   :favorites, dependent: :destroy
	has_many   :product_categories, dependent: :destroy
	has_many   :categories, through: :product_categories
	has_many   :memories
	has_many   :reservations

	attachment :product_image
	is_impressionable counter_cache: true

with_options presence: true do
  validates :product_name
  validates :product_text
  validates :product_price
end

	def favorite_end_user(end_user)
		favorites.where(end_user_id: end_user.id).exists?
	end

	def impressions_counts(end_user)
		return self.impressions.where(user_id: end_user.id).count
	end

	def self.ranking
		@ranking = Product.find(Favorite.group(:product_id).order('count(product_id) desc').limit(5).pluck(:product_id))
	end

	def self.iine_ranking
		@ranking = Product.find(Favorite.group(:product_id).order('count(product_id) desc').limit(50).pluck(:product_id))
	end

	def self.view
		@view = Product.order('impressions_count desc').limit(5)
	end

	def self.ranking_view
		@view = Product.order('impressions_count desc').limit(50)
	end
end
