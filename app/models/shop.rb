class Shop < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :product_categories, dependent: :destroy
  belongs_to :producer

  attachment :shop_image

  geocoded_by :address_city
  after_validation :geocode, if: :address_city_changed?

  with_options presence: true do
  validates :shop_name
  validates :shop_text
  validates :prefecture_code
  validates :address_city
  validates :address_street
  validates :open
  validates :close
  validates :station
  validates :minutes_on_foot
  validates :minutes_on_car
  validates :regular_holiday
  validates :phone_number
end

  include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

end
