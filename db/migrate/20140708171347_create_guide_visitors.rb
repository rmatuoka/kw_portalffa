class CreateGuideVisitors < ActiveRecord::Migration
  def self.up
    create_table :guide_visitors do |t|
      t.integer :guide_id
      t.datetime :year
      t.boolean :visit
      t.integer :passengers
      t.timestamps
    end
  end

  def self.down
    drop_table :guide_visitors
  end
end
