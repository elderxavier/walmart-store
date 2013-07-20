class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :document
      t.string :address
      t.string :state
      t.string :city
      t.string :zip_code
      t.timestamps
    end
  end
end
