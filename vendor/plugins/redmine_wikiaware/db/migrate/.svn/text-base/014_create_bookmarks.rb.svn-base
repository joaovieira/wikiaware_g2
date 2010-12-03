class CreateBookmarks < ActiveRecord::Migration
  def self.up
    create_table :bookmarks do |t|
      t.column :description, :string
      t.column :location, :string
      t.column :name, :string
      t.column :position, :integer
      t.column :page_id, :integer
      t.column :user_id, :integer
    end
  end

  def self.down
    drop_table :bookmarks
  end
end
