require 'redmine'
require 'dispatcher'
require 'principal'
require 'user'
require 'wikiaware_sections'
require_dependency 'redmine_links/hooks/controller_wiki_edit_after_save'

Redmine::Plugin.register :redmine_wikiaware do
  name 'Wikiaware'
  author '4MIEIC1 2010/2011'
  description 'This is a social interactions plugin for Redmine\'s wiki engine.'
  version '0.0.1'
  url 'http://ihuru.fe.up.pt/ldso/1011/doku.php?id=wikiaware'
  author_url 'http://ihuru.fe.up.pt/ldso/1011/doku.php?id=wikiaware'
  menu :application_menu, :posts, {:controller=>'posts', :action=>'index'}, :caption=>'Microblogging'
end

Dispatcher.to_prepare :redmine_comments do
  unless User.included_modules.include? WikiawarePatch::User
    User.send(:include, WikiawarePatch::User)
  end

  unless WikiPage.included_modules.include? WikiawarePatch::WikiPage
    WikiPage.send(:include, WikiawarePatch::WikiPage)
  end
end