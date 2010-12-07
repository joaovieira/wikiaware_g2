class AddStatsListSizeToWikis < ActiveRecord::Migration
  def self.up
    add_column :wikis, :stats_list_size, :integer, :default => 3, :null => false 
  end
 
  def self.down
    remove_column :wikis, :stats_list_size
  end
end
