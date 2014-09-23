class Category < ActiveRecord::Base
  has_many :review_categories
  has_many :posts, through: :review_categories
end