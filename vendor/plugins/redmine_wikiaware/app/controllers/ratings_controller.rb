class RatingsController < ApplicationController
  unloadable


  def like
    @user_id = params[:user_id]
    @page_id = params[:page_id]
    @pr = PageRating.find_or_create_by_user_id_and_page_id :user_id => @user_id, :page_id => @page_id
    @pr.like
    @pr.save
    @likes_number = PageRating.get_likes(@page_id)
    @dislikes_number = PageRating.get_dislikes(@page_id)
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end    
  end

  def dislike
    @user_id = params[:user_id]
    @page_id = params[:page_id]
    @pr = PageRating.find_or_create_by_user_id_and_page_id :user_id => @user_id, :page_id => @page_id
    @pr.dislike
    @pr.save
    @likes_number = PageRating.get_likes(@page_id)
    @dislikes_number = PageRating.get_dislikes(@page_id)
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end  
end
