class CreateSectionComments < ActiveRecord::Migration
  def self.up
    create_table :section_comments do |t|
      t.references :user
      t.references :wiki_section
      t.text :content
      t.integer :version_created
      t.integer :version_deleted

      t.timestamps
    end
  end

  def self.down
    drop_table :section_comments
  end
end
