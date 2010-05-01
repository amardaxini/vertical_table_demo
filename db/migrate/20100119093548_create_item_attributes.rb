class CreateItemAttributes < ActiveRecord::Migration
  def self.up
    create_table :item_attributes do |t|
      t.string :name
      t.text :value
      t.integer :item_id
      t.integer :product_attribute_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :item_attributes
  end
end
