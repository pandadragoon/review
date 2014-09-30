class CreateUserReviews < ActiveRecord::Migration
  def change
    create_table :user_reviews do |t|
      t.float :user_review
      t.integer :post_id
      t.integer :user_id
      t.timestamps
    end
  end
end
