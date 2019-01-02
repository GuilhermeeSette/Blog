class Tag < ApplicationRecord
  has_many :taggings
  has_many :posts, through: :taggings
  paginates_per 30
  scope :filter_tags, -> tags_ids {where(id: tags_ids.split(', '))}



end
