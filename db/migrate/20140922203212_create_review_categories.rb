class CreateReviewCategories < ActiveRecord::Migration
  def change
    create_table :review_categories do |t|
      t.string :name
    end
  end
end
