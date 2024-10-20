class CreatePromotions < ActiveRecord::Migration[8.0]
  def change
    create_table :promotions do |t|
      t.string :code
      t.integer :discount

      t.timestamps
    end
  end
end
