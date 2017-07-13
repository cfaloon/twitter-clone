Rails.application.routes.draw do

  get '/now_following' => 'epicenter#now_following'
  get '/unfollow' => 'epicenter#unfollow'
  get '/tag_tweets' => 'epicenter#tag_tweets'
  get '/all_users' => 'epicenter#all_users'
  get 'following' => 'epicenter#following'
  get 'followers' => 'epicenter#followers'
  
  resources :tweets
  devise_for :users

  get '/:username' => 'epicenter#show_user', as: :show_user
  
  root 'epicenter#feed'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
