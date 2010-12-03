require_dependency 'wiki_controller'

module WikiControllerPatch
  def self.included(base) # :nodoc:
	base.extend(ClassMethods)
    base.send(:include, InstanceMethods)
	base.class_eval do
		unloadable
		alias_method_chain :index, :adicionar_navegacao
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
    
  end
end

WikiController.send(:include,  WikiControllerPatch)

