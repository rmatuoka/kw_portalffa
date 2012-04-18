class AddMenuDisplayToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :menu_display, :boolean
  end

  def self.down
    remove_column :categories, :menu_display
  end
end
