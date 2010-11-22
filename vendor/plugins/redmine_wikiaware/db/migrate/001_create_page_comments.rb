class CreatePageComments < ActiveRecord::Migration
  def self.up
    create_table :page_comments do |t|
      t.references :user
      t.references :wiki_page
      t.text :content
      t.integer :version_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :page_comments
  end
end
