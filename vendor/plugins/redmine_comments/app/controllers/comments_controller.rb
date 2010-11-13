class CommentsController < ApplicationController
  unloadable

  def create
  	user_id = User.current
	PageComment.create(:user_id=>user_id, :page_id=>params[:page_id],
			   :content=>params[:comment_text], :version_id=>params[:page_version_id])
	redirect_to :back
  end

  def show
  end
end
