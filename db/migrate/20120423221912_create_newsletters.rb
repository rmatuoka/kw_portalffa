class CreateNewsletters < ActiveRecord::Migration
  def self.up
    create_table :newsletters do |t|
      t.string :email
      t.boolean :active, :default => 1
      t.boolean :published, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :newsletters
  end
end
