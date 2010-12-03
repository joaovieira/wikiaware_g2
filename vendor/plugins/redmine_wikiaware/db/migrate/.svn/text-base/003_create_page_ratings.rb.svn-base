class CreatePageRatings < ActiveRecord::Migration
  def self.up
    create_table :page_ratings do |t|
      t.column :like, :boolean
    end
  end

  def self.down
    drop_table :page_ratings
  end
end
