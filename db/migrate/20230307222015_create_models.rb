class CreateModels < ActiveRecord::Migration[7.0]
  def change
    create_table :models do |t|
      t.references :brand, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :average_price
      t.timestamps
    end

    add_index :models, 'lower(name), brand_id', unique: true
  end
end
