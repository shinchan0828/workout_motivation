class AddElementsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :admin, :boolean
    add_column :users, :image, :string
  end
end
