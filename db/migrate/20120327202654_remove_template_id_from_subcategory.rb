class RemoveTemplateIdFromSubcategory < ActiveRecord::Migration
  def self.up
    remove_column :subcategories, :template_id
  end

  def self.down
    add_column :subcategories, :template_id, :integer
  end
end
