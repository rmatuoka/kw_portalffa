class AddActiveToGuideType < ActiveRecord::Migration
  def self.up
    add_column :guide_types, :active, :boolean, :default => 1
  end

  def self.down
    remove_column :guide_types, :active
  end
end
