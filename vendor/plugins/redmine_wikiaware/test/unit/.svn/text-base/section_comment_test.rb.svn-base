require File.dirname(__FILE__) + '/../test_helper'

class SectionCommentTest < ActiveSupport::TestCase
  #self.use_transactional_fixtures = true
  fixtures :section_comments
  
  def setup
    @admin = User.find(1)
    @custom_page = WikiPage.new(:content => WikiContent.new(:version => 1))
    @custom_section = WikiSection.new(:wiki_page => @custom_page)
  end
  
  def test_create
    section_comment = SectionComment.new
        
    #should not save without content
    assert !section_comment.save, "Saved the comment without content"
    assert_equal section_comment.errors.count, 4
        
    #should not save without user
    section_comment.content = 'ola'
    assert !section_comment.save, "Saved the comment without user"
    assert_equal section_comment.errors.count, 3
    
    #should not save without page
    section_comment.user = @admin
    assert !section_comment.save, "Saved the comment without page"
    assert_equal section_comment.errors.count, 2
    
    #should not save without version
    section_comment.wiki_section = @custom_section
    assert !section_comment.save, "Saved the comment without version"
    assert_equal section_comment.errors.count, 1
    
    #correctly save comment
    section_comment.version_created = @custom_section.wiki_page.content.version
    assert section_comment.save, "Saved correct comment"
  end

  context "On searching comments" do
    setup do
      @section_comment1 = section_comments(:section_comment001) #comment from version 1 until 3
      @section_comment2 = section_comments(:section_comment002) #comment from version 2 until now
    end
    
    should "find 2 comments from version 2" do
      assert_equal [@section_comment1, @section_comment2], SectionComment.find_all_from_version(2)
    end
    
    should "find 1 comment from version 3" do
      assert_equal [@section_comment2], SectionComment.find_all_from_version(3)
    end
  end
end
