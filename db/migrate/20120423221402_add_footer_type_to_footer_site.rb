class AddFooterTypeToFooterSite < ActiveRecord::Migration
  def self.up
    add_column :footer_sites, :footer_type, :integer
  end

  def self.down
    remove_column :footer_sites, :footer_type
  end
end
