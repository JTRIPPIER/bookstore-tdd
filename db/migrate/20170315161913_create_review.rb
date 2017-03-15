class CreateReview < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.text :name
      t.text :comment

      t.references :book, index: true

      t.timestamps
    end
  end
end
