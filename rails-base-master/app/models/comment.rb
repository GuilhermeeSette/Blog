class Comment < ApplicationRecord
  has_many :comments, foreign_key: :parent_comment_id
  validates :body, presence: true
end
