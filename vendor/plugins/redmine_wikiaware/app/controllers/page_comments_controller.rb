class PageCommentsController < ApplicationController
  unloadable
  before_filter :require_login, :only => [:create]

  def create
  	@page = WikiPage.find(params[:wiki_page_id])
  	@comment = PageComment.new(:content => params[:content_text], :version_id => @page.content.version)
  	@comment.user = User.current
  	@comment.wiki_page = @page
  	
  	if @comment.save
  	  flash[:notice] = "Comment was successfully submited."
  	else
  	  flash[:error] = "Error submitting comment: empty content!"
  	end
  	
  	redirect_to :back
  end
  
  def destroy
    @comment = PageComment.find(params[:id])
    if @comment.destroy
  	  flash[:notice] = "Comment deleted."
  	else
  	  flash[:error] = "Error deleting comment!"
  	end
  	
    redirect_to :back
  end

end
