class PageComment < ActiveRecord::Base
  unloadable
  belongs_to :users
  belongs_to :wiki_pages
end
