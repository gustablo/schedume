class InviteMailer < ApplicationMailer
  def invite(guest, code)
    @guest = guest
    @code = code

    mail(to: @guest.email, subject: "Invite for interview")
  end
end
