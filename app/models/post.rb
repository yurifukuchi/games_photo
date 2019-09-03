class Post < ApplicationRecord
  belongs_to :user
  belongs_to :post_category
  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  mount_uploader :image, ImageUploader

  paginates_per 15

  def self.search(search)
    if search
      where(['text LIKE ?', "%#{search}%"]) 
    else
      all
    end
  end

  def self.good(user)
    likes.create(user_id: user.id)
  end

  def ungood(user)
    likes.find_by(user_id: user.id).destroy
  end
  
  
end
