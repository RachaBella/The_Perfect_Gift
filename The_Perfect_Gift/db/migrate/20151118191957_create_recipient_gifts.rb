class CreateRecipientGifts < ActiveRecord::Migration
  def change
    create_table :recipient_gifts do |t|
      t.references :recipient, index: true, foreign_key: true
      t.references :gift, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
