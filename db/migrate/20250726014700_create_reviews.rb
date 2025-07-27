class CreateReviews < ActiveRecord::Migration[8.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :review_text
      t.string :reviewer_name
      t.date :review_date
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
