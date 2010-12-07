class PageView < ActiveRecord::Base
  unloadable
  belongs_to :user
  belongs_to :wiki_page

  attr_accessible :views, :last_view
end

