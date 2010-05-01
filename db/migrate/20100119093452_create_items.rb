class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :name
      t.boolean :is_active
      t.integer :product_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :items
  end
end
