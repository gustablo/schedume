Rails.application.routes.draw do
  get "guest_mode/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "home#index"

  scope "/confirmation" do
    scope "/:code" do
      get "", to: "guest_invite_confirmation#first_step", as: "first_step"
      post "", to: "guest_invite_confirmation#confirm_first_step", as: "confirm_first_step"
      
      get "/finish", to: "guest_invite_confirmation#second_step", as: "second_step"
      post "/finish", to: "guest_invite_confirmation#confirm_second_step", as: "confirm_second_step"

      get "thank-you", to: "guest_invite_confirmation#thank_you", as: "thank_you"
    end

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
