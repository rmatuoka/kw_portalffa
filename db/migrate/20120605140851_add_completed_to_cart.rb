class AddCompletedToCart < ActiveRecord::Migration
  def self.up
    add_column :carts, :completed, :boolean, :default => false
  end

  def self.down
    remove_column :carts, :completed
  end
end
