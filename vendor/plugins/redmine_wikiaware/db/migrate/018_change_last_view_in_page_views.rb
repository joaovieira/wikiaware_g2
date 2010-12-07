class ChangeLastViewInPageViews < ActiveRecord::Migration
    def self.up
      change_table :page_views do |t|
        t.change :last_view, :datetime, :null => true
      end
    end

    def self.down
      hange_table :page_views do |t|
        t.change :last_view, :datetime, :null => false
      end
    end
  end

