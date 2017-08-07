class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable# , :omniauthable

  has_many :tweets

  mount_uploader :avatar, AvatarUploader

  validates :username, presence: true, uniqueness: true
  validates :tag_color, format: { with: /\A#[0-9A-Fa-f]{6}\z/ }

  serialize :following, Array

  def followers
    User.all.select{ |u| u.following.include? self.id }
  end
end
