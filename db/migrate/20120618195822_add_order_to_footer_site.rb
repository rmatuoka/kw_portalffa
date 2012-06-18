class AddOrderToFooterSite < ActiveRecord::Migration
  def self.up
    add_column :footer_sites, :footer_order, :integer
  end

  def self.down
    remove_column :footer_sites, :footer_order
  end
end
