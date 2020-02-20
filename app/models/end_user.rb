class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many   :product_comments, dependent: :destroy
  has_many   :favorites, dependent: :destroy
  has_many   :memories, dependent: :destroy
  has_many   :reservations, dependent: :destroy

  attachment :profile_image

  acts_as_paranoid
end
