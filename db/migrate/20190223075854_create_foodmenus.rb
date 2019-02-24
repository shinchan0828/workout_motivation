class CreateFoodmenus < ActiveRecord::Migration[5.2]
  def change
    create_table :foodmenus do |t|
      t.string :title
      t.string :category
      t.integer :fat
      t.integer :carbo
      t.string :description
      t.string :ingredient
      t.string :recipe
      t.string :image
      t.string :movie
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :foodmenus, [:user_id, :created_at]
  end
end
