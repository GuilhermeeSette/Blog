class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_secure_pass

end
