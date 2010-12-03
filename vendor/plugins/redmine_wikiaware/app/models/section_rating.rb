class SectionRating < ActiveRecord::Base
  unloadable
  belongs_to :users
  belongs_to :wiki_sections

  def like
    self.like = true
  end
  
  def dislike
    self.like = false
  end
  
  def self.get_likes(section_id, version_id)
    return SectionRating.find_all_by_section_id_and_version_id_and_like(section_id, version_id, true).count
  end
  
  def self.get_dislikes(section_id, version_id)
    return SectionRating.find_all_by_section_id_and_version_id_and_like(section_id, version_id, false).count
    #return PageRating.count(:user_id, :conditions => ["page_id='?' and `like`=?", page_id, false]);
  end

  def self.rated?(user_id, section_id, version_id)
    return SectionRating.find_all_by_user_id_and_section_id_and_version_id(user_id, section_id, version_id).count.equal?(1)
  end

  def self.liked?(user_id, section_id, version_id)
    @sr = SectionRating.find_by_user_id_and_section_id_and_version_id(user_id, section_id, version_id)
    if @sr then
      return @sr[:like].equal?(true)
    else
      return false
    end
  end

  def self.disliked?(user_id, section_id, version_id)
    @sr = SectionRating.find_by_user_id_and_section_id_and_version_id(user_id, section_id, version_id)
    if @sr then
      return @sr[:like].equal?(false)
    else
      return false
    end
  end
  
  def self.get_sections(page_id)
    @sections = WikiSection.find_all_by_page_id(page_id);
    return @sections
  end
  
end
