class AddPublicActiveToConfiguration < ActiveRecord::Migration
  def self.up
    add_column :configurations, :active, :boolean
    add_column :configurations, :published, :boolean
  end

  def self.down
    remove_column :configurations, :published
    remove_column :configurations, :active
  end
end
