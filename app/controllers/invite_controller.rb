class InviteController < ApplicationController
  layout "admin"

  include Session
  include Flash

  before_action :require_login

  def index
    @invite = Invite.new
  end

  def create
    @invite = Invite.new

    @invite.possible_dates = get_params[:possible_dates]
    @invite.code = SecureRandom.uuid()
    @invite.operator_id = session[:operator_id]
    @invite.confirmed = false

    guest = find_or_create_guest()
    @invite.guest_id = guest.id

    if @invite.save
      InviteMailer.invite(guest, @invite.code).deliver_later
      notice "Invite sent"
      redirect_to admin_url
    else
      alert "Error trying to create invite"
      render :index, status: :bad_request
    end
  end

  private

  def get_params
    params.require(:invite).permit(:email, :name, :possible_dates)
  end

  def find_or_create_guest
    guest = Guest.find_by(email: get_params[:email])
    if !guest.present?
      guest = Guest.create(email: get_params[:email], name: get_params[:name])
    end

    return guest
  end
end
