class AddVersionDeletedToPageComments < ActiveRecord::Migration
  def self.up
    add_column :page_comments, :version_deleted, :integer
    rename_column :page_comments, :version_id, :version_created 
  end

  def self.down
    remove_column :page_comments, :version_deleted
    rename_column :page_comments, :version_created, :version_id
  end
end
