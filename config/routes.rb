Rails.application.routes.draw do
  namespace :api do
    resource :humidity, only: :show

    resource :temperature, only: :show

    resource :lamp, only: [:show] do
      member do
        put :on
        put :off
        put 'color/:red/:green/:blue' => 'lamps#color', as: :color
      end
    end
  end
end
