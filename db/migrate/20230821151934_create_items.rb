class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.decimal :price, precision: 10, scale: 2, null: false
      
      t.string :photo # You can adjust this based on how you handle photos

      t.timestamps
    end
    add_index :items, :title, unique: true
  end
end
