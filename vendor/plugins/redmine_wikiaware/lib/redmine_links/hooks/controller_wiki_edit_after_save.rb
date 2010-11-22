module RedmineLinks
	 class Hooks 
		class ControllerWikiEditAfterSaveHook < Redmine::Hook::ViewListener
			def controller_wiki_edit_after_save(context={ })			
				Link.delete_all(["origem = ?", context[:params][:page]])
				
				parsed=(LinksController.new).parseLinks(context[:params][:content][:text]) 

				parsed.uniq.each do |str|
						link = Link.new(			
								:origem => context[:params][:page],  #vai buscar o nome da pagina
								:destino => str
						)
						link.save		
				end
			end
		end
	 end
end 
