Rails.application.routes.draw do
  devise_for :users

  # Rutas públicas (sin autenticación)
  get 'home/index', to: 'home#index', as: 'public_home'
  
  # Rutas que requieren autenticación
  authenticate :user do
    root to: 'home#index'
    
    resources :students do
      member do
        patch :update_status
      end
    end

    resources :teachers do
      member do
        patch :update_status
      end
    end

    resources :courses
    resources :subjects
    resources :news

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

    resources :attendances, only: [:create, :edit, :update, :destroy] do
      collection do
        get 'select_course'
        get 'select_subject'
        get 'select_course_new'
        get 'select_subject_new'

        get :new_select_course_attendance
        get :select_students
        post :create_attendances  
      end
    end

    get 'show_attendances', to: 'attendances#show_attendances', as: 'show_attendances'
    get 'select_course_new', to: 'attendances#select_course_new', as: 'new_select_course_attendance'
  end
end
