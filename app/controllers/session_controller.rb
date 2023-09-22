class SessionController < ApplicationController
  include Flash

  def sigin
    operator = Operator.find_by(email: params[:email].downcase)

    if operator&.authenticate(params[:password])
      session[:operator_id] = operator.id
      notice "Sign in successfully"
      redirect_to admin_path
    else
      alert "Incorrect credentials"
      redirect_to root_path
    end
  end
end
