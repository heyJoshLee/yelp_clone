class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :body
      t.integer :business_id, :user_id
      t.timestamps
    end
  end
end
