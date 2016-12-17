class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  validates :title, presence: true, length: {maximun:100,minimum:6}
  validates :description, presence: true
  validates :user_id, presence:true
end
