Rails.application.routes.draw do

  get 'book/index'
  post 'book/addbooks'

  get 'book/gotoSelect'
  post 'book/selectsolr'



  get 'usercenter/index'

  post 'login/loginuser'
  get 'login/index'
  get 'welcome/index'
  



  resources :usertables
  resources :welcome
  root 'welcome#index'
end
