ActionController::Routing::Routes.draw do |map|
  map.resources :wiki_page, :has_many => :page_comments 
end