class CreateGuideTypes < ActiveRecord::Migration
  def self.up
    create_table :guide_types do |t|
      t.string :code
      t.string :description
      t.timestamps
    end
  end

  def self.down
    drop_table :guide_types
  end
end
