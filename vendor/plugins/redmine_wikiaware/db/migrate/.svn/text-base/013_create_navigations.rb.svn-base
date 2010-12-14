class CreateNavigations < ActiveRecord::Migration
  def self.up
    create_table :navigations do |t|
      t.column :origem, :int
      t.column :destino, :int
      t.column :data, :timestamp
    end
  end

  def self.down
    drop_table :navigations
  end
end
