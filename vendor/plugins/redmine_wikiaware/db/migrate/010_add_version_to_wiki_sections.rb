class AddVersionToWikiSections < ActiveRecord::Migration
  def self.up
    add_column :wiki_sections, :version_id, :integer    
  end

  def self.down
    remove_column :wiki_sections, :version_id       
  end
end
