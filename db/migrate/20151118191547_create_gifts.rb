class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.string :name
      t.decimal :price
      t.string :imageUrl
      t.string :link
      t.string :description

      t.timestamps null: false
    end
  end
end
