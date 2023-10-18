Rails.application.routes.draw do
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # config/routes.rb
  # config/routes.rb
  # config/routes.rb
  root 'home#index'#pagina de inicio
 

  #activacion de recursos para Estudiantes
  resources :students do
    member do
      patch :update_status
    end
  end
  
  #activacion de recursos para Docentes
  resources :teachers do
    member do
      patch :update_status
    end
  end

  #activacion de recursos para Cursos
  resources :courses

  #activacion de recursos para Materias
  resources :subjects

  #activacion de recursos para Noticias
  resources :news

  #activacion de recursos para Calificaciones
  resources :grades, only: [:new, :create, :edit, :update, :destroy] do
    collection do
      get 'select_course'
      get 'select_subject'
      get 'select_grade_type'
      post 'create'
      get 'select_in_course'
      get 'select_in_subject'
      get 'show_index' 
      
    end
  end

  #activacion de recursos para Asistencias
  
  resources :attendances, only: [:create, :edit, :update, :destroy] do
    collection do
      get 'select_course'
      get 'select_subject'
      get 'select_course_new'
      get 'select_subject_new'

      get :new_select_course_attendance
      get :select_students # Esta es la ruta que necesitas
      post :create_attendances  
    end
  end
  get 'show_attendances', to: 'attendances#show_attendances', as: 'show_attendances'
  get 'select_course_new', to: 'attendances#select_course_new', as: 'new_select_course_attendance'

end
