class AddActiveToGuideVisitor < ActiveRecord::Migration
  def self.up
    add_column :guide_visitors, :active, :boolean, :default => 1
  end

  def self.down
    remove_column :guide_visitors, :active
  end
end
