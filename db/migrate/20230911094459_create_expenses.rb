class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.string :name, null: false
      t.decimal :amount, null: false
      t.references :author, null: false, foreign_key: { to_table: :users }, index: true

      t.timestamps
    end
  end
end
