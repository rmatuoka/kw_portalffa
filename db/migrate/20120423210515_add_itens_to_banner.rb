class AddItensToBanner < ActiveRecord::Migration
  def self.up
    add_column :banners, :clicks, :integer, :default => 0
    add_column :banners, :active, :boolean, :default => 1
    add_column :banners, :published, :boolean, :default => 0
  end

  def self.down
    remove_column :banners, :published
    remove_column :banners, :active
    remove_column :banners, :clicks
  end
end
