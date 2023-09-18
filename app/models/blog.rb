class Blog < ApplicationRecord
    has_many_attached :blogimages
    has_many :comments
    has_many :likes, dependent: :destroy, counter_cache: true

    def likes_count
        likes.count
      end
    def liked_by?(user)
        likes.exists?(user: user)
      end
end

 
