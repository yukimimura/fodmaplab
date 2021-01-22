class Step < ApplicationRecord
  belongs_to :recipe

  validates :number, presence: true
  validates :content, presence: true, length: {maximum: 60}
end
