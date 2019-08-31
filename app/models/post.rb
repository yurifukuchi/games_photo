class Post < ApplicationRecord
  belongs_to :user
  belongs_to :post_category

  mount_uploader :image, ImageUploader

  paginates_per 30

  def self.search(search)
    if search
      where(['text LIKE ?', "%#{search}%"]) 
    else
      all
    end
  end
end
