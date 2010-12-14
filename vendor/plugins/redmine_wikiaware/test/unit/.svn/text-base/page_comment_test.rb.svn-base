require File.dirname(__FILE__) + '/../test_helper'

class PageCommentTest < ActiveSupport::TestCase
  #self.use_transactional_fixtures = true
  fixtures :page_comments
  
  def setup
    @admin = User.find(1)
    @custom_page = WikiPage.new(:content => WikiContent.new(:version => 1))
  end
  
  def test_create
    page_comment = PageComment.new
        
    #should not save without content
    assert !page_comment.save, "Saved the comment without content"
    assert_equal page_comment.errors.count, 4
        
    #should not save without user
    page_comment.content = 'ola'
    assert !page_comment.save, "Saved the comment without user"
    assert_equal page_comment.errors.count, 3
    
    #should not save without page
    page_comment.user = @admin
    assert !page_comment.save, "Saved the comment without page"
    assert_equal page_comment.errors.count, 2
    
    #should not save without version
    page_comment.wiki_page = @custom_page
    assert !page_comment.save, "Saved the comment without version"
    assert_equal page_comment.errors.count, 1
    
    #correctly save comment
    page_comment.version_created = @custom_page.content.version
    assert page_comment.save, "Saved correct comment"
  end

  context "On searching comments" do
    setup do
      @page_comment1 = page_comments(:page_comment001) #comment from version 1 until 3
      @page_comment2 = page_comments(:page_comment002) #comment from version 2 until now
    end
    
    should "find 2 comments from version 2" do
      assert_equal [@page_comment1, @page_comment2], PageComment.find_all_from_version(2)
    end
    
    should "find 1 comment from version 3" do
      assert_equal [@page_comment2], PageComment.find_all_from_version(3)
    end
  end
end
