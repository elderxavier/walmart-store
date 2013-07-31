class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.references :category
      t.decimal :price
      t.timestamps
    end
    add_index :products, :category_id
  end
end
