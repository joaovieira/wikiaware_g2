# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def link_to_page (name, wiki_page, anchor={})
    p = WikiPage.find(wiki_page.id)
    w = Wiki.find(p.wiki_id)
    proj = Project.find(w.project_id)
    link_to name, "/projects/#{proj.identifier}/wiki/#{p.title}\##{anchor}"
  end

end
