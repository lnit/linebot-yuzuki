Rails.application.routes.draw do
  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  get 'callback'=> 'linebots#callback'
end
