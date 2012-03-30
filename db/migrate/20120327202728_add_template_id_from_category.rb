class AddTemplateIdFromCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :template_id, :integer
  end

  def self.down
    remove_column :categories, :template_id
  end
end
