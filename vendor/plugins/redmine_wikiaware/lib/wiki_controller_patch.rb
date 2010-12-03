require_dependency 'wiki_controller'

module WikiControllerPatch
  def self.included(base) # :nodoc:
	base.extend(ClassMethods)
    base.send(:include, InstanceMethods)
	base.class_eval do
		unloadable
		alias_method_chain :index, :adicionar_navegacao
		alias_method_chain :edit, :actualiza_commentable
	end
  end
  
  module ClassMethods
  end
  
  module InstanceMethods
		def index_with_adicionar_navegacao
		
		
		referer = request.env['HTTP_REFERER']
		if(referer!=nil)
		   array1 = Array.new
		   array1=referer.split('/')
		   
		   ori = request.path
		   array2 = Array.new
		   array2 =ori.split('/')
		  
		   navegacao = Navegacao.new(			
									:origem => array1.at(array1.length-1),  
									:destino => array2.at(array2.length-1),
									:data => Time.new
							)
			navegacao.save
		end
			
		page_title = params[:page]
    @page = @wiki.find_or_new_page(page_title)
    if @page.new_record?
      if User.current.allowed_to?(:edit_wiki_pages, @project) && editable?
        edit
        render :action => 'edit'
      else
        render_404
      end
      return
    end
    if params[:version] && !User.current.allowed_to?(:view_wiki_edits, @project)
      # Redirects user to the current version if he's not allowed to view previous versions
      redirect_to :version => nil
      return
    end
    @content = @page.content_for_version(params[:version])
    if User.current.allowed_to?(:export_wiki_pages, @project)
      if params[:format] == 'html'
        export = render_to_string :action => 'export', :layout => false
        send_data(export, :type => 'text/html', :filename => "#{@page.title}.html")
        return
      elsif params[:format] == 'txt'
        send_data(@content.text, :type => 'text/plain', :filename => "#{@page.title}.txt")
        return
      end
    end
    @editable = editable?
    render :action => 'show'

		   	
		end
		
  	def edit_with_actualiza_commentable
  	  @page = @wiki.find_or_new_page(params[:page])    
      return render_403 unless editable?
      @page.content = WikiContent.new(:page => @page) if @page.new_record?

      @content = @page.content_for_version(params[:version])
      @content.text = initial_page_content(@page) if @content.text.blank?
      # don't keep previous comment
      @content.comments = nil
      if request.get?
        # To prevent StaleObjectError exception when reverting to a previous version
        @content.version = @page.content.version
      else
        if !@page.new_record? && @content.text == params[:content][:text] && @content.commentable == params[:content][:commentable] ############
          attachments = Attachment.attach_files(@page, params[:attachments])
          render_attachment_warning_if_needed(@page)
          # don't save if text wasn't changed
          redirect_to :action => 'index', :id => @project, :page => @page.title
          return
        end
        #@content.text = params[:content][:text]
        #@content.comments = params[:content][:comments]
        @content.attributes = params[:content]
        
        if !@content.was_ever_commentable?
          @content.was_ever_commentable = @content.commentable
        end

        @content.author = User.current
        # if page is new @page.save will also save content, but not if page isn't a new record
        if (@page.new_record? ? @page.save : @content.save)
          attachments = Attachment.attach_files(@page, params[:attachments])
          render_attachment_warning_if_needed(@page)
          call_hook(:controller_wiki_edit_after_save, { :params => params, :page => @page})
          redirect_to :action => 'index', :id => @project, :page => @page.title
        end
      end
    rescue ActiveRecord::StaleObjectError
      # Optimistic locking exception
      flash[:error] = l(:notice_locking_conflict)
    end
  	   
  end
end

WikiController.send(:include,  WikiControllerPatch)

