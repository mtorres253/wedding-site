class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :adults
      t.integer :children
      t.string :comments

      t.timestamps
    end
  end
end
