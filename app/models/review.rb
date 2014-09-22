class Review < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :review_categories
  has_many :categories, through: :review_categories
end