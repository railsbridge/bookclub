ActionController::Routing::Routes.draw do |map|

  map.resource :page, :only => [ "show" ]
  map.root :controller => "pages", :action => "show", :id => 'index'
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
