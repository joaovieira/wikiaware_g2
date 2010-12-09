class WikiSection < ActiveRecord::Base
  unloadable
  belongs_to :wiki_page 

  has_many :section_comments
end
