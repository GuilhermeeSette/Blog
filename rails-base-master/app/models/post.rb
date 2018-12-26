class Post < ApplicationRecord

  has_many :taggings
  has_many :comments, foreign_key: :parent_comment_id
  has_many :tags, through: :taggings
  validates :title, :content, :autor, presence: true
  paginates_per 10

  def self.tagged_with(id)
    Tag.find_by!(id: id.to_i).posts
  end

  def self.tag_counts
    Tag.select('tags.*, count(taggings.tag_id) as count').joins(:taggings).group('taggings.tag_id')
  end

  def tag_list
    tags.map(&:name).join(', ')
  end

  def tag_list=(names)
    self.tags = self.tags | names.split(',').map do |name|
      Tag.where(name: name.strip.downcase).first_or_create!
    end
  end

end
