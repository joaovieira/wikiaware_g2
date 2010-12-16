class WikiSection < ActiveRecord::Base
  unloadable
  belongs_to :wiki_page, :class_name => 'WikiPage', :foreign_key => 'page_id'

  has_many :section_comments
end
