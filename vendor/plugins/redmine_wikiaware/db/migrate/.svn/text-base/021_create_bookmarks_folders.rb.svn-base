class CreateBookmarksFolders < ActiveRecord::Migration
  def self.up
    create_table :bookmarks_folders do |t|
      t.column :name, :string
      t.column :user_id, :integer
    end
  end

  def self.down
    drop_table :bookmarks_folders
  end
end
