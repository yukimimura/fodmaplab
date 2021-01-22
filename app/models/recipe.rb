class Recipe < ApplicationRecord
  validates :image, presence: true
  validates :title, presence: true, length: {maximum: 20}
  validates :description, presence: true, length: {maximum: 60}
  validates :people, presence: true

  belongs_to :user

  has_many :ingredients, dependent: :destroy
  accepts_nested_attributes_for :ingredients, allow_destroy: true

  has_many :steps, dependent: :destroy
  accepts_nested_attributes_for :steps, allow_destroy: true

  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user

  # mount_uploader :image, ImageUploader
end
