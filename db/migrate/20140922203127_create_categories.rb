class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :review_id
      t.integer :user_id
    end
  end
end
