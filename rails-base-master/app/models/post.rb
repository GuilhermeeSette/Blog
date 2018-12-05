class Post < ApplicationRecord
  validates :title, :content, :autor, presence: true
end
