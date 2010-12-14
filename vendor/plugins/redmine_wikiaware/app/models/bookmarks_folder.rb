class BookmarksFolder < ActiveRecord::Base
  unloadable
  belongs_to :user, :foreign_key => 'user_id'
  has_many :bookmarks, :foreign_key => 'folder_id'
end
