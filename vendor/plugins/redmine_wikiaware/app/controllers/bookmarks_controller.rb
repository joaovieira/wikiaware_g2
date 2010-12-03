class BookmarksController < ApplicationController
  unloadable

  def create
    @user_id = params[:user_id]
    @page_id = params[:page_id]
  	@bookmark = Bookmark.new (:user_id => @user_id, :page_id => @page_id )

  	@bookmark.save
  	
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end   
  end
  
  def delete
    @user_id = params[:user_id]
    @page_id = params[:page_id]
  	@bookmark = Bookmark.find_by_user_id_and_page_id(@user_id, @page_id )
  	@bookmark.delete
  	
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end   
  end
  
  def edit
    
    @user_id = params[:user_id]
    @page_id = params[:page_id]
    
    @bookmark = Bookmark.find_by_user_id_and_page_id(@user_id, @page_id)
        
    if params[:bookmark]
      @bookmark.description = params[:bookmark][:description]
      @bookmark.name = params[:bookmark][:name]
      @bookmark.save
    end
    
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end    
    
  end
  
  def show_edit
    @bookmark = Bookmark.find_by_user_id_and_page_id(@user_id, @page_id)
  
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end  
  end
  
end
