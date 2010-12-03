class AddPrimaryKeysToPageRatings < ActiveRecord::Migration
  def self.up
    add_column :page_ratings, :user_id, :integer    
    add_column :page_ratings, :page_id, :integer    
  end

  def self.down
    remove_column :page_ratings, :user_id   
    remove_column :page_ratings, :page_id   
  end
end
