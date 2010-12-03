class PageComment < ActiveRecord::Base
  unloadable
  belongs_to :user
  belongs_to :wiki_page
  
  attr_accessible :content, :version_id
  
  validates_presence_of :content
end
