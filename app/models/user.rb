class User < ApplicationRecord
  validates :name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :recipes, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :myfavorites, through: :favorites, source: :recipe

  def already_favorited?(recipe)
    self.favorites.exists?(recipe_id: recipe.id)
  end

  def total_fav
    total = 0
    self.myfavorites.each do |f|
      total += f.favorites.count
    end
    return total
  end
end
