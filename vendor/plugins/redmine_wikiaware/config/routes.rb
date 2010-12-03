ActionController::Routing::Routes.draw do |map|
  map.resources :wiki_page, :has_many => :page_comments

  # grupo5
  map.resources :posts
  map.resources :friendships,
    :member => { :accept => :get, :block => :get, :reject => :get }
  # /grupo5
end

