class CreateCeramics < ActiveRecord::Migration[7.0]
  def change
    create_table :ceramics do |t|
      t.string :photo
      t.string :name
      t.string :region
      t.text :about
      t.string :price
      t.integer :user_id

      t.timestamps
    end
  end
end
