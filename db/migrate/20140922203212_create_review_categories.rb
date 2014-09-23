class CreateReviewCategories < ActiveRecord::Migration
  def change
    create_table :review_categories do |t|
      t.integer :review_id
      t.integer :review_id
    end
  end
end
