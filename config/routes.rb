Rails.application.routes.draw do
  root to: "pages#home"

  namespace :api do
    namespace :v1 do
      post 'resize' => 'image_resizer#create', as: :resize
    end
  end
end
