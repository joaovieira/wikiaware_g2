class AddFolderToBookmarks < ActiveRecord::Migration
  def self.up
    add_column :bookmarks, :folder_id, :integer, :null => false
  end

  def self.down
    remove_column :bookmarks, :folder_id       
  end
end
