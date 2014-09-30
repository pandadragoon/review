class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :review_categories
  has_many :categories, through: :review_categories
  has_many :user_reviews

  def avg_rating
    total = 0
    self.user_reviews.each do |usr_review|
      total += usr_review.user_review
    end
    total = total / self.user_reviews.size
    total.round(1)
  end
end