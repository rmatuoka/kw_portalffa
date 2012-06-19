class AddShowDateToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :show_date, :boolean
  end

  def self.down
    remove_column :categories, :show_date
  end
end
