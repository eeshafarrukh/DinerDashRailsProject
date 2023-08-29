class AddRetiredToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :retired, :boolean
  end
end
