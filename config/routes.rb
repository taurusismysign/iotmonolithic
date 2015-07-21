require 'which_domain'

Rails.application.routes.draw do

  #resources :tweets

  constraints(InternetOfTweetsCheck) do
    match '/', :controller => 'tweets', :action => 'index', :via => 'get'
    match '/category/(:id)', :controller => 'tweets', :action => 'index', :via => 'get'
  end


  match '/tweets/filtertweet', :controller => 'tweets', :action => 'filtertweet', :via => 'post'
  match '/tweets/fastsignup', :controller => 'tweets', :action => 'fastsignup', :via => 'post'
  match '/tweets/category/(:id)', :controller => 'tweets', :action => 'index', :via => 'get'


end
