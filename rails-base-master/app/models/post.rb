class Post < ApplicationRecord
  validates :title, :content, :autor, presence: true
  paginates_per 5
end
