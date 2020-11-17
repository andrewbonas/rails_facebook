class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, foreign_key: :liked_post_id, dependent: :destroy
  has_many :likers, through: :likes
  
  validates :body, presence: true
end
