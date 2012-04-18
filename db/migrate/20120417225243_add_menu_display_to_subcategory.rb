class AddMenuDisplayToSubcategory < ActiveRecord::Migration
  def self.up
    add_column :subcategories, :menu_display, :boolean
  end

  def self.down
    remove_column :subcategories, :menu_display
  end
end
