class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.float :rating
      t.text :description
      t.text :body
      t.integer :user_id
      t.timestamps
    end
  end
end
