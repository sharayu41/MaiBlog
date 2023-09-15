class Blog < ApplicationRecord
    has_many_attached :blogimages
    has_many :comments
end

 
