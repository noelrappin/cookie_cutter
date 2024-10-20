class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price_in_cents

      t.timestamps
    end
  end
end
