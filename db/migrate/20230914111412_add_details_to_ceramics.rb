class AddDetailsToCeramics < ActiveRecord::Migration[7.0]
  def change
    add_column :ceramics, :lat, :float
    add_column :ceramics, :lng, :float
  end
end
