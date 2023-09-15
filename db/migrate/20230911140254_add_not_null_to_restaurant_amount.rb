class AddNotNullToRestaurantAmount < ActiveRecord::Migration[7.0]
  def change
    change_column_null :restaurants, :icon, false
  end
end
