require File.dirname(__FILE__) + '/../test_helper'

class PageCommentTest < ActiveSupport::TestCase
  
  test "should not save an empty comment" do
    page_comment = PageComment.new
    assert !page_comment.save, "Saved the comment without content"
  end

end
