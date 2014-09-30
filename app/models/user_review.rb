class UserReview < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates_uniqueness_of :user, scope: :post_id
end