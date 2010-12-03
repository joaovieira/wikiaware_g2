class AddCommentableAndWasEverCommentableToWikiContents < ActiveRecord::Migration
  def self.up
    add_column :wiki_contents, :commentable, :boolean, :default => false
    add_column :wiki_contents, :was_ever_commentable, :boolean, :default => false
  end

  def self.down
    remove_column :wiki_contents, :was_ever_commentable
    remove_column :wiki_contents, :commentable
  end
end
