class AddActiveToGuide < ActiveRecord::Migration
  def self.up
    add_column :guides, :active, :boolean, :default => 1
  end

  def self.down
    remove_column :guides, :active
  end
end
