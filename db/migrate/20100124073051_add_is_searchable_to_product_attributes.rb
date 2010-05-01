class AddIsSearchableToProductAttributes < ActiveRecord::Migration
  def self.up
    add_column :product_attributes, :is_searchable, :boolean
  end

  def self.down
    remove_column :product_attributes, :is_searchable
  end
end
