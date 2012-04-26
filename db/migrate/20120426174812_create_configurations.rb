class CreateConfigurations < ActiveRecord::Migration
  def self.up
    create_table :configurations do |t|
      t.string :email_adm
      t.string :email_compras
      t.string :email_contato
      t.string :email_imprensa
      t.string :copyright
      t.string :address
      t.string :phone
      t.string :schedule
      t.string :twitter
      t.string :facebook
      t.string :youtube
      t.timestamps
    end
  end

  def self.down
    drop_table :configurations
  end
end
