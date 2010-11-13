module RedmineComments
  module PageCommentsUserPatch
    def self.included(base)
      base.class_eval do
        unloadable 
        has_many :page_comments, :class_name => 'PageComment'
      end
    end 
  end
end
