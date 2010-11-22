class LinksController < ApplicationController
  # GET /links
  # GET /links.xml
  def index
			
     @links = Link.find_by_sql(["SELECT destino,COUNT( * ) FROM links GROUP BY destino ORDER BY COUNT( * ) LIMIT 0 , 5"])

	 nrows = Link.count
	 
	 if nrows == 0
		paginas=Wiki.find_by_sql(["SELECT title, text  FROM wiki_pages NATURAL JOIN wiki_contents WHERE 1=1"])
		
		paginas.each do |pagina|		
				parsed=parseLinks(pagina.text) 

				parsed.uniq.each do |str|
						link = Link.new(			
								:origem => pagina.title, 
								:destino => str
						)
						link.save		
				end			
		end
	 end
	
	render :partial => 'links/actualiza_links.erb'
	
  end

	def parseLinks(texto={})	
				arrayAux = Array.new
				arrayLinks = Array.new

				arrayAux = texto.split("]]")
				arrayAux.each do |s|
					if s.index("[[") != nil 
						sAux = s.split("[[").at(1)
						if sAux.index("|") != nil
							arrayLinks.push( sAux.split("|").at(0).gsub(/[\s]+/,"_"))
						else
							arrayLinks.push(sAux.gsub(/[\s]+/,"_"))			
						end
				    end
					
				end
				
				return arrayLinks
	end
end