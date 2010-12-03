class CreateLinks < ActiveRecord::Migration
  def self.up
    create_table :links do |t|
      t.column :origem, :string
      t.column :destino, :string
    end
  end

  def self.down
    drop_table :links
  end
end
