class CreateUploadCategories < ActiveRecord::Migration
  def self.up
    create_table :upload_categories do |t|
      t.string :name
      t.boolean :active
      t.boolean :published
      t.timestamps
    end
  end

  def self.down
    drop_table :upload_categories
  end
end
