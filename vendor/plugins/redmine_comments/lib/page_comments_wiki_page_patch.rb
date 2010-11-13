module RedmineComments
    module PageCommentsWikiPagePatch
        def self.included(base)
            base.class_eval do
                unloadable 
                has_many :page_comments
                has_many :users, :through => :page_comments
            end
        end 
    end
end
