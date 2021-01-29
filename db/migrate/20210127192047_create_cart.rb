class CreateCart < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do
      |t|
      t.references :items
      t.references :customer
      t.timestamps
    end
  end
end
