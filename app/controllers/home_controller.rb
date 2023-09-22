class HomeController < ApplicationController
  include Flash

  def index
    if session[:operator_id]
      # redirect_to admin_path
    end
  end
end
