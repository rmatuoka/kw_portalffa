class RemoveTypeFromWebpart < ActiveRecord::Migration
  def self.up
    remove_column :webparts, :type
  end

  def self.down
    add_column :webparts, :type, :string
  end
end
