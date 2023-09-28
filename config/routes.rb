Rails.application.routes.draw do
  get "guest_mode/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "home#index"

  scope "/confirmation" do
    get "/:code", to: "guest_invite_confirmation#first_step"
    post "/:code", to: "guest_invite_confirmation#confirm_first_step", as: "confirm_first_step"

    get "/:code/finish", to: "guest_invite_confirmation#second_step", as: "second_step"
    post "/:code/finish", to: "guest_invite_confirmation#confirm_second_step", as: "confirm_second_step"
  end

  post "/sigin", to: "session#sigin"

  scope "/admin" do
    get "", to: "admin#index", as: "admin"

    scope "/invite" do
      get "", to: "invite#index", as: "invite"
      post "", to: "invite#create", as: "create_invite"
    end
  end
end
