class Article < ApplicationRecord
  validates :title,presence:true, length: {maximun:100,minimum:6}
  validates :description,presence:true
end
