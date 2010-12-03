class Bookmark < ActiveRecord::Base
  unloadable
  belongs_to :users
  belongs_to :wiki_pages
  
  def self.exists?(page_id, user_id)
    return Bookmark.find_all_by_page_id_and_user_id(page_id, user_id).count == 1
  end
  
end
