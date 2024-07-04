class CreateSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :spots do |t|
      
      t.string :person
      t.string :title
      t.string :body
      t.string :address
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
