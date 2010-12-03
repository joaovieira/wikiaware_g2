class CreateSectionRatings < ActiveRecord::Migration
  def self.up
    create_table :section_ratings do |t|
      t.column :like, :boolean
      t.column :section_id, :integer
      t.column :user_id, :integer
      t.column :version_id, :integer
    end
  end

  def self.down
    drop_table :section_ratings
  end
end
