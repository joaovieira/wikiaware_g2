class PageCommentsController < ApplicationController
  unloadable
  before_filter :require_login, :only => [:create]

  def create
  	@page = WikiPage.find(params[:wiki_page_id])
  	@comment = PageComment.new(params[:page_comment])
  	@comment.user = User.current
  	@comment.wiki_page = @page
  	@comment[:version_id] = @page.content.version
  	
  	if @comment.save
  	  flash[:notice] = "Comentário adicionado!"
  	else
  	  flash[:error] = "Erro ao inserir comentário!"
  	end
  	
  	redirect_to :back
  end

end
