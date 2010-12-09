class SectionComment < ActiveRecord::Base
  unloadable
  belongs_to :user
  belongs_to :wiki_section
    
  validates_presence_of :content
  
  def self.find_all_from_version(version, current_version)
      SectionComment.all(:conditions => ["? >= version_created AND
                                      (version_deleted IS NULL OR ? < version_deleted)", 
                                      version, version])
  end
end
