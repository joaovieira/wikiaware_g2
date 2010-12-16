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
  
  def self.get_toolbar(user_id)
    bookmarks = Bookmark.find_all_by_user_id(user_id, :conditions => 'position IS NOT NULL', :order => 'position ASC')
    return bookmarks
  end
  
  def put_on_toolbar(user_id)
    bookmarks = Bookmark.get_toolbar(user_id)

    if self.position.nil?
      self.position = bookmarks.size + 1
    elsif self.position <= bookmarks.size 
      bookmarks = Bookmark.find_all_by_user_id(user_id, :conditions => "position >= #{self.position}")
      
      bookmarks.each do |bk|
        if (!bk.id.equal?(self.id))
          bk.position += 1
          bk.save
        end
      end
    end
  end

  def place_on_toolbar(user_id, prev_pos)
    bookmarks = Bookmark.get_toolbar(user_id)

    if self.position.nil?
      self.position = bookmarks.size + 1
    elsif self.position <= bookmarks.size
      bk = Bookmark.find_by_user_id_and_position(user_id, position, :conditions => "user_id <> #{self.id}")
      if !bk.nil? 
        bk.position = prev_pos
        bk.save
      end
    end
  end
  
  def remove_from_toolbar(user_id)
    pos = self.position
    self.position = nil
    
    bookmarks = Bookmark.get_toolbar(user_id)
    for b in bookmarks do
      if b.position > pos
        b.position -= 1
        b.save
      end
    end
  end
  
  def self.bookmarks_positions_list(user_id, page_id)
    bks_list = []
    bookmarks = Bookmark.get_toolbar(user_id)
    bookmarks.each do |bk|
      bks_list << bk.position
    end
    
    bk = Bookmark.find_by_user_id_and_page_id(user_id, page_id)
    if !bk.nil? and bk.position.nil?
      bks_list << bookmarks.size + 1
    end
    
    return bks_list
  end
 
end
