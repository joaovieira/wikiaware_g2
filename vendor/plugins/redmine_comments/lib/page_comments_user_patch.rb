module RedmineComments
  module PageCommentsUserPatch
    def self.included(base)
      base.class_eval do
        unloadable 
        has_many :page_comments
        has_many :wiki_pages, :through => :page_comments
      end
    end 
  end
end
