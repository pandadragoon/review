class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :user_reviews 

  has_secure_password validations: false
end