class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_friendship
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
         
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, foreign_key: :liker_id
  has_many :liked_posts, through: :likes
  has_many :friend_requests_as_requestor, foreign_key: :requestor_id, class_name: 'FriendRequest'
  has_many :friend_requests_as_receiver, foreign_key: :receiver_id, class_name: 'FriendRequest'
  has_one_attached :avatar

  def self.from_omniauth(auth)
 
    user = User.where(email: auth.info.email).first
    user ||= User.create!(provider: auth.provider, uid: auth.uid, name: auth.info.name, email: auth.info.email, password: Devise.friendly_token[0, 20])
    user
  end


end
