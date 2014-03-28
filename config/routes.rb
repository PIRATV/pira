Pira::Application.routes.draw do

  resources :user_sessions
  resources :users, only: [:new, :create, :update, :destroy]

  get 'login' => 'user_sessions#new', as: :login
  match 'logout' => 'user_sessions#destroy', as: :logout, via: [:get, :post]

  get '/Продукция/:category',constraints:{
      category: /[-_%a-z0-9]+/iu
  },to: 'site#production'

  get '/Продукция/:category/:type',constraints:{
      category: /[-_%a-z0-9]+/iu
  },to: 'production#show'

  mount Ckeditor::Engine => '/ckeditor'
  mount RailsAdmin::Engine => '/administration', as: 'rails_admin'

  root 'site#index'

  #english urls
  get '/:action', to: 'site#:action', constraints: {action: /contact|work|services|albums|production/i}
  #russian urls
  get '/Контакты', to: 'site#contact', as: :contact
  get '/Вакансии', to: 'site#work', as: :job
  get '/Услуги', to: 'site#services', as: :services
  get '/Продукция', to: 'site#production', as: :production
  get '/Портфолио', to: 'site#albums', as: :albums
  get '/Портфолио/:album', to: 'site#portfolio', album: /[-_a-z0-9а-яё%]+/i, as: :portfolios
  #send form
  post '/contact', to: 'site#send_email_form'
  post '/Контакты', to: 'site#send_email_form'

  get '/Экраны', to: 'services#led'
  get '/Сайты', to: 'services#sites'
  get '/Работа_на_фрезере', to: 'services#milling'
  get '/Интерактивная_пленка', to: 'services#proj_film'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
