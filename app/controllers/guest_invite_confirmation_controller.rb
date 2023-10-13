class GuestInviteConfirmationController < ApplicationController
  before_action :find_invite, except: [:thank_you]

  include Flash

  def first_step
    @code = params[:code]
  end

  def confirm_first_step
    first_step_params = params.require(:invite).permit(:possible_confirmed_dates)

    if has_empty?(first_step_params, [:possible_confirmed_dates])
      alert "Select at least one date"
      return redirect_to first_step_url(params[:code])
    end

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
    @confirmed_dates = @invite.possible_confirmed_dates_to_a
  end

  def confirm_second_step
    @invite.build_confirmed_datetimes(params[:start], params[:end]) do
      return redirect_to second_step_url(params[:code])
    end

    @invite.confirmed = true

    if @invite.save
      alert nil
      redirect_to thank_you_url
    else
      alert "Error trying to confirm"
    end
  end

  def thank_you
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

  def has_empty?(params, symbols)
    symbols.any? { |s| params[s].blank? }
  end
end
