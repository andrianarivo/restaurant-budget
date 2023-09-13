class RemoveIconToRestaurant < ActiveRecord::Migration[7.0]
  def change
    remove_column :restaurants, :icon
  end
end
