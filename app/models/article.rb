class Article < ActiveRecord::Base
  belongs_to :category
  has_many :comments
  has_many :tags
end
