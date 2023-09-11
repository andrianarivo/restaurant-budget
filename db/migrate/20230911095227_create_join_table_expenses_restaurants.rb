class CreateJoinTableExpensesRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_join_table :expenses, :restaurants do |t|
      t.index :expense_id
      t.index :restaurant_id
    end
  end
end
