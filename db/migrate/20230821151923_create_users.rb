class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :full_name, null: false
      t.string :display_name
      t.timestamps
    end

  end
end
