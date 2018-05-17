class Article < ApplicationRecord
  has_many :comments, dependent: :destroy #Manually added
  validates :title, presence: true, length: { minimum: 5 }
end
