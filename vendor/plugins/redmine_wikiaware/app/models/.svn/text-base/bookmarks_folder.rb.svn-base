class BookmarksFolder < ActiveRecord::Base
  unloadable
  belongs_to :user, :foreign_key => 'user_id'
  has_many :bookmarks, :foreign_key => 'folder_id'

  def delete_all
    bks_list = Bookmark.find_all_by_folder_id(self.id)
    bks_list.each do |bk|
      bk.delete
    end
  end
end
