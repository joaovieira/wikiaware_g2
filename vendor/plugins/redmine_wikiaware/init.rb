require 'redmine'
require 'dispatcher'
require 'principal'
require 'user'
require 'wikiaware_sections'
require 'wiki_controller_patch'
require_dependency 'redmine_links/hooks/controller_wiki_edit_after_save'

Redmine::Plugin.register :redmine_wikiaware do
  name 'Wikiaware'
  author '4MIEIC1 2010/2011'
  description 'This is a social interactions plugin for Redmine\'s wiki engine.'
  version '0.0.1'
  url 'http://ihuru.fe.up.pt/ldso/1011/doku.php?id=wikiaware'
  author_url 'http://ihuru.fe.up.pt/ldso/1011/doku.php?id=wikiaware'
# grupo 5
  menu :application_menu, :posts, {:controller=>'posts', :action=>'index'}, :caption=>'Microblogging'
  menu :application_menu, :subscriptions, {:controller=>'subscriptions', :action=>'index'}, :caption=>'Subscriptions'
  menu :application_menu, :notifications, {:controller=>'notifications', :action=>'index'}, :caption=>'Notifications'
# grupo 5
# grupo 3
  menu :application_menu, :bookmarks, {:controller=>'bookmarks', :action=>'index'}, :caption=>'Bookmarks'
# grupo 3  
end

Dispatcher.to_prepare :redmine_wikiaware do
  unless User.included_modules.include? WikiawarePatch::User
    User.send(:include, WikiawarePatch::User)
  end

  unless WikiPage.included_modules.include? WikiawarePatch::WikiPage
    WikiPage.send(:include, WikiawarePatch::WikiPage)
  end

  unless WikiHelper.included_modules.include? WikiawarePatch::WikiHelper
    WikiHelper.send(:include, WikiawarePatch::WikiHelper)
  end
end

