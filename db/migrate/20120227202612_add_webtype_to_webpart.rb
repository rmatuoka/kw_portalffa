class AddWebtypeToWebpart < ActiveRecord::Migration
  def self.up
    add_column :webparts, :webtype, :string
  end

  def self.down
    remove_column :webparts, :webtype
  end
end
