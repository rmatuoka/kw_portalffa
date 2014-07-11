class CreateGuides < ActiveRecord::Migration
  def self.up
    create_table :guides do |t|
      t.string :name
      t.string :department
      t.string :address
      t.string :district
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :phone
      t.string :fax
      t.string :email
      t.string :internet
      t.text :obs
      t.integer :guide_type_id
      t.boolean :reminder
      t.boolean :mail
      t.datetime :year
      t.timestamps
    end
  end

  def self.down
    drop_table :guides
  end
end
