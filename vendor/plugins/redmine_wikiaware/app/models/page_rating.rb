class PageRating < ActiveRecord::Base
  unloadable
  belongs_to :users
  belongs_to :wiki_pages

  def like
    self.like = true
  end
  
  def dislike
    self.like = false
  end
  
  def self.get_likes(page_id)
    return PageRating.find_all_by_page_id_and_like(page_id, true).count
  end
  
  def self.get_dislikes(page_id)
    return PageRating.find_all_by_page_id_and_like(page_id, false).count
    #return PageRating.count(:user_id, :conditions => ["page_id='?' and `like`=?", page_id, false]);
  end

  def self.rated?(user_id, page_id)
    return PageRating.find_all_by_user_id_and_page_id(user_id, page_id).count.equal?(1)
  end

  def self.liked?(user_id, page_id)
    @pr = PageRating.find_by_user_id_and_page_id(user_id, page_id)
    if @pr then
      return @pr[:like].equal?(true)
    else
      return false
    end
  end

  def self.disliked?(user_id, page_id)
    @pr = PageRating.find_by_user_id_and_page_id(user_id, page_id)
    if @pr then
      return @pr[:like].equal?(false)
    else
      return false
    end
  end
end
