class CreateNavegacao < ActiveRecord::Migration
  def self.up
    create_table :navegacaos do |t|
      t.column :origem, :string
      t.column :destino, :string
      t.column :data, :timestamp
    end
  end

  def self.down
    drop_table :navegacaos
  end
end
