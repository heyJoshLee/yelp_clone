class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.text :description
      t.integer :category_id
      t.timestamps
    end
  end
end
