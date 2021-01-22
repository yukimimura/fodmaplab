class User < ApplicationRecord
  validates :name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[google_oauth2]

  has_many :recipes, dependent: :destroy

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      # deviseのuserカラムに name を追加している場合は以下のコメントアウトも追記します
      user.name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

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