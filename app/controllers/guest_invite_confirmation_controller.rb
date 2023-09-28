class GuestInviteConfirmationController < ApplicationController
  before_action :find_invite

  include Flash

  def first_step
    @code = params[:code]
  end

  def confirm_first_step
    first_step_params = params.require(:invite).permit(:possible_confirmed_dates)
    @invite.possible_confirmed_dates = first_step_params[:possible_confirmed_dates]

    if @invite.save
      alert nil
      redirect_to second_step_url
    else
      alert "Error trying to confirm"
    end
  end

  def second_step
    @code = params[:code]
    @confirmed_dates = @invite.possible_confirmed_dates.split(",")
  end
  
  def confirm_second_step
    start_dates = params[:start]
    end_dates = params[:end]
    
    puts end_dates, start_dates
  end

  private

  def find_invite
    @invite = Invite.find_by(code: params[:code])

    if @invite.present?
      alert nil
    else
      alert "Invite not found"
    end
  end
end
