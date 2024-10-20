class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.references :buyer, null: false, foreign_key: false
      t.references :recipient, null: false, foreign_key: false

      t.timestamps
    end
  end
end
