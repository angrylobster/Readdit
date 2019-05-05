class Shelves < ActiveRecord::Migration[5.2]
  def change
    create_table :shelves do |t|
      t.references :user
      t.references :book
      t.string :name
      t.timestamps
    end
  end
end