class Tag < ApplicationRecord
  has_many :taggings
  has_many :posts, through: :taggings
  paginates_per 30


end
