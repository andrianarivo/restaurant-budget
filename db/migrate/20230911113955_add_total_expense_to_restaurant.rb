class AddTotalExpenseToRestaurant < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :total_expense, :decimal
  end
end
