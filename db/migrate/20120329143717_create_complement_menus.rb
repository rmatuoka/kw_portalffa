class CreateComplementMenus < ActiveRecord::Migration
  def self.up
    create_table :complement_menus do |t|
      t.string :name
      t.string :destination
      t.boolean :active
      t.boolean :published
      t.timestamps
    end
  end

  def self.down
    drop_table :complement_menus
  end
end
