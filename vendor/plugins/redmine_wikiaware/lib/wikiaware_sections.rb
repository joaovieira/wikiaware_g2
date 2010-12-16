require 'redmine'

module WikiawareSections
  def WikiawareSections.preview_page
    @@preview_page ||= WikiPage.new
  end

  Redmine::WikiFormatting::Macros.register do
    desc "Defines a section on the page.\n\n"+
      "  @{{section(title, id)}}@\n"
    macro :section do |obj, args|
      return nil if args.length < 2
      
      page = obj.page if obj
      page = WikiawareSections.preview_page unless page
      return nil unless page
      
              
      title = args[0].strip
      
      section_id = args[1].strip
      section = page.sections.find_or_create_by_id(section_id)
      section.title = title
            
      if not params.has_key?('version')
        section.version_id = page.content.version
        section.save
      end
      
      
      o = ""
      o << stylesheet_link_tag("wikiaware", :plugin => "redmine_wikiaware")
      o << "<div class=\"wikiaware_section\" id=\"wikiaware_section_#{section_id}\">
<a name='wikiaware_section_title_#{section_id}'> #{title} </a>
<span class =\"wikiaware_section_rating\" id=\"wikiaware_section_rating_#{section_id}\">"
      o << render(:partial => "ratings/show_section", :plugin => "redmine_wikiaware", :locals => { :section_id => section_id, :page_id => page.id, :version_id => obj.version })
      o << "</span></div>"
      return o
    end


    desc "Defines an end of section on the page.\n\n"+
      "  @{{section_end(id)}}@\n"
    macro :section_end do |obj, args|
      return nil if args.length < 1
      
      page = obj.page if obj
      page = WikiawareSections.preview_page unless page
      return nil unless page
            
      section_id = args[0].strip
      section = page.sections.find_or_create_by_id(section_id)
      section_comments_version = section.section_comments.find_all_from_version(obj.version)   
    
      if not params.has_key?('version')
        section.version_id = page.content.version
        section.wiki_page = page
        section.save
      end
      
      
      o = ""
      o << "<div id=\"wikiaware_section_end_#{section_id}\"><span class =\"wikiaware_section_comments\" id=\"wikiaware_section_comments_#{section_id}\">"
      o << render(:partial => "comments/show_section", :plugin => "redmine_wikiaware", :locals => { :section => section, :section_comments_version => section_comments_version, :version_id => obj.version, :page => page})
      o << "</span></div>"
      return o
    end
  end
end
