class AddCommentableAndWasEverCommentableToWikiContentVersions < ActiveRecord::Migration
  def self.up
    add_column :wiki_content_versions, :commentable, :boolean, :default => false
    add_column :wiki_content_versions, :was_ever_commentable, :boolean, :default => false
  end

  def self.down
    remove_column :wiki_content_versions, :was_ever_commentable
    remove_column :wiki_content_versions, :commentable
  end
end
