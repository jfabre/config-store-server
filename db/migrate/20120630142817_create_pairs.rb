class CreatePairs < ActiveRecord::Migration
  def change
    create_table :pairs do |t|
      t.string :key
      t.string :value
      t.integer :store_id

      t.timestamps
    end
  end
end
