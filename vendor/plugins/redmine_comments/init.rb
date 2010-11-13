require 'redmine'
require 'dispatcher'
require 'principal'
require 'user'
require 'page_comments_user_patch'
require 'page_comments_wiki_page_patch'

Redmine::Plugin.register :redmine_comments do
  name 'Redmine Comments plugin'
  author 'Grupo 2'
  description 'This is a plugin for Redmine that allows comments on pages'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
end

Dispatcher.to_prepare :redmine_comments do
  unless User.included_modules.include? RedmineComments::PageCommentsUserPatch
    User.send(:include, RedmineComments::PageCommentsUserPatch)
  end
  
  unless WikiPage.included_modules.include? RedmineComments::PageCommentsWikiPagePatch
    WikiPage.send(:include, RedmineComments::PageCommentsWikiPagePatch)
  end
end 
