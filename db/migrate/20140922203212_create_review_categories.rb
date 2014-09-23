class CreateReviewCategories < ActiveRecord::Migration
  def change
    create_table :review_categories do |t|
      t.integer :post_id
      t.integer :category_id
    end
  end
end
