class PageCommentsController < ApplicationController
  unloadable
  before_filter :require_login #:authorize

  def create
  	@page = WikiPage.find(params[:wiki_page_id])
  	comment = params[:page_comment]
  	comment[:user_id] = User.current
  	comment[:version_id] = @page.content.version;
  	
  	if PageComment.new(comment).valid?
  	  @page.page_comments.create(comment)
  	  flash[:notice] = "Comentário adicionado!"
  	else
  	  flash[:error] = "Erro ao inserir comentário! Conteúdo vazio."
  	end
  	
  	redirect_to :back
  end

end
