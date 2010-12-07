class CreatePageViews < ActiveRecord::Migration
    def self.up
      create_table :page_views do |t|
        t.references :user, :null => false
        t.references :wiki_page, :null => false
        t.integer  :views, :default => 0, :null => false
        t.datetime :last_view, :null => false
      end
    end

    def self.down
      drop_table :page_views
    end
  end

