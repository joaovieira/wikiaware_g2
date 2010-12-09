ActionController::Routing::Routes.draw do |map|
  map.resources :wiki_page, :has_many => :page_comments
  map.resources :wiki_section, :has_many => :section_comments

  # grupo5
  map.resources :posts
  map.resources :friendships,
    :member => { :accept => :get, :block => :get, :reject => :get }
  map.resources :subscriptions, :only => [:index, :create, :destroy]
  # /grupo5
end

