require 'redmine'

require_dependency 'redmine_links/hooks/controller_wiki_edit_after_save'


Redmine::Plugin.register :redmine_links do
  name 'Redmine Links plugin'
  author 'Author name'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
end
