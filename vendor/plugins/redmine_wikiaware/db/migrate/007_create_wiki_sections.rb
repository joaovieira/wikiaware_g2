class CreateWikiSections < ActiveRecord::Migration
  def self.up
    create_table :wiki_sections do |t|
      #t.references :wiki_pages
      t.column :page_id, :integer
      t.column :title, :text
    end
  end

  def self.down
    drop_table :wiki_sections
  end
end
