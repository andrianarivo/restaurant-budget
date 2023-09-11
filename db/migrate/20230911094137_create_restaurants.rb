class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :icon
      t.references :user, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
