class PageComment < ActiveRecord::Base
  unloadable
  belongs_to :user
  belongs_to :wiki_page
    
  validates_presence_of :content, :user, :wiki_page, :version_created
  
  def self.find_all_from_version version
      PageComment.all(:conditions => ["? >= version_created AND
                                      (version_deleted IS NULL OR ? < version_deleted)", 
                                      version, version])
  end
end
