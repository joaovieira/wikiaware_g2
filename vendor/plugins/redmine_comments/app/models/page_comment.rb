class PageComment < ActiveRecord::Base
  unloadable
  belongs_to :users
  belongs_to :wiki_pages
  
  attr_accessible :user_id, :wiki_page_id, :content, :version_id
  
  validates_presence_of :content
end
