class Reservation < ApplicationRecord
	belongs_to :end_user
	attachment :product_image

with_options presence: true do
  validates :start_date
  validates :end_date
end
end
