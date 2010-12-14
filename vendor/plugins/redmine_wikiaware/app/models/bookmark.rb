class Bookmark < ActiveRecord::Base
  unloadable
  belongs_to :bookmarks_folder, :foreign_key => 'folder_id'
  belongs_to :page, :class_name => 'WikiPage', :foreign_key => 'page_id'
  
  def self.exists?(page_id, user_id)
    return Bookmark.find_all_by_page_id_and_user_id(page_id, user_id).count == 1
  end
  
  def get_page_link
    p = WikiPage.find(self.page_id)
    w = Wiki.find(p.wiki_id)
    proj = Project.find(w.project_id)
    return "/projects/#{proj.identifier}/wiki/#{p.title}"
  end
  
end
