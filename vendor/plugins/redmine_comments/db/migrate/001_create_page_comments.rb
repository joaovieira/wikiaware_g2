class CreatePageComments < ActiveRecord::Migration
  def self.up
    create_table :page_comments do |t|
      t.column :user_id, :integer
      t.column :page_id, :integer
      t.column :content, :text
      t.column :version_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :page_comments
  end
end
