class AddColorToContent < ActiveRecord::Migration
  def self.up
    add_column :contents, :color, :string
  end

  def self.down
    remove_column :contents, :color
  end
end
