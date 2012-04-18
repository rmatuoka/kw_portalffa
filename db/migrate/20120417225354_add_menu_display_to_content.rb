class AddMenuDisplayToContent < ActiveRecord::Migration
  def self.up
    add_column :contents, :menu_display, :boolean
  end

  def self.down
    remove_column :contents, :menu_display
  end
end
