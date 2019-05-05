class BooksShelves < ActiveRecord::Migration[5.2]
  def change
    create_table :books_shelves do |t|
      t.references :book
      t.references :shelf
      t.timestamps
    end
  end
end