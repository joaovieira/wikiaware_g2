class AddCommentableAndWasEverCommentableToWikiPages < ActiveRecord::Migration
  def self.up
    add_column :wiki_pages, :commentable, :boolean, :default => false
    add_column :wiki_pages, :was_ever_commentable, :boolean, :default => false
  end

  def self.down
    remove_column :wiki_pages, :was_ever_commentable
    remove_column :wiki_pages, :commentable
  end
end
