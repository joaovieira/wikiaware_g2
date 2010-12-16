class BookmarksController < ApplicationController
  unloadable

  def create
    @user_id = params[:user_id]
    @page_id = params[:page_id]
  	@bookmark = Bookmark.new(:user_id => @user_id, :page_id => @page_id )
  	
  	@page = WikiPage.find(@page_id)
  	
  	@bookmark.name = @page.title
  	
  	@folders = User.find_by_id(@user_id).bookmarks_folders
  	
  	if (@folders.count > 0)
  	  @folder = @folders[0]
  	else
  	  @folder = BookmarksFolder.new(:name => "Default", :user_id => @user_id)
  	  @folder.save
  	end
  	
  	@bookmark.folder_id = @folder.id

  	@bookmark.save
  	
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end   
  end
  
  def delete
puts "\n#\n#\n#\n#\n#\n#"
    @user_id = params[:user_id]
    @page_id = params[:page_id]
  	@bookmark = Bookmark.find_by_user_id_and_page_id(@user_id, @page_id )
  puts "#-1\n"
  	@bookmarks = User.current.bookmarks
  puts "#0\n"
    @bookmarks_folders = User.current.bookmarks_folders
  	
  puts "#1\n"
  	if @bookmark.position

  puts "#2\n"  	
  toolbar = Bookmark.get_toolbar(@user_id)
  	  toolbar.delete_at(@bookmark.position-1)
  	  
  	  toolbar.each_with_index {|elem, i|
  	    elem.position = i+1
        elem.save
  	  }  	  
  	end
  puts "#3\n"	
  	@bookmark.delete
  	
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end   
  end
  
  def delete_folder
    @bookmarks = User.current.bookmarks
    @bookmarks_folders = User.current.bookmarks_folders
  	
    bks_f = BookmarksFolder.find(params[:folder_id])
    if bks_f then
      bks_f.delete_all
      bks_f.delete
    end
    
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
      @bookmark.folder_id = params[:bookmark][:folder_id]
      prev_pos = @bookmark.position
      @bookmark.position = params[:bookmark][:position]
      @bookmark.save
      @bookmark.place_on_toolbar(@user_id, prev_pos)
    end
    
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end    
    
  end

  def index
    @bookmarks = User.current.bookmarks
    @bookmarks_folders = User.current.bookmarks_folders
  end
  
  def change_folder
    @bookmarks = User.current.bookmarks
    @bookmarks_folders = User.current.bookmarks_folders
    
    @bookmark_id = params[:bookmark_id]
    @folder_id = params[:folder_id]
    
    @bookmark = Bookmark.find(@bookmark_id)
    @bookmark.folder_id = @folder_id
    
    @bookmark.save
    
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end    
  end
  
  def put_on_toolbar
    @bookmarks = User.current.bookmarks
    @bookmarks_folders = User.current.bookmarks_folders
    
    @bookmark_id = params[:bookmark_id]
    @bookmark = Bookmark.find(@bookmark_id)
    
    @bookmark.place_on_toolbar(User.current, nil)
    @bookmark.save
    
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end    
    
  end
  
  def remove_from_toolbar
    @bookmarks = User.current.bookmarks
    @bookmarks_folders = User.current.bookmarks_folders
    
    @bookmark_id = params[:bookmark_id]
    @bookmark = Bookmark.find(@bookmark_id)
    
    @bookmark.remove_from_toolbar(User.current)
    @bookmark.save
    
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end    
    
  end
  
  def create_folder  
    if params[:name]
      @bf = BookmarksFolder.new
      @bf.name = params[:name]
      @bf.user_id = params[:user_id]
      @bf.save
    end
    
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end    
  end
  
end
