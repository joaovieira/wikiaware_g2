class SectionCommentsController < ApplicationController

  def create
  	@section = WikiSection.find(params[:wiki_section_id])
	@page = WikiPage.find(@section.page_id)
  	@comment = SectionComment.new(:content => params[:content_text], :version_created => @page.content.version)
  	@comment.user = User.current
  	@comment.wiki_section = @section
  	
  	if @comment.save
  	  flash[:notice] = "Comment was successfully submited."
  	else
  	  flash[:error] = "Error submitting comment: empty content!"
  	end
  	
  	redirect_to :back
  end

  def destroy
    @comment = SectionComment.find(params[:id])
    @page = WikiPage.find(@comment.wiki_section.page_id)
    if @page.content.version == 1
        if @comment.destroy
	  flash[:notice] = "Comment deleted."
  	else
  	  flash[:error] = "Error deleting comment!"
  	end
    else
    	@comment.version_deleted = @page.content.version
	if @comment.save
	  flash[:notice] = "Comment deleted."
  	else
  	  flash[:error] = "Error deleting comment!"
  	end
    end
  	
    redirect_to :back
  end
end
