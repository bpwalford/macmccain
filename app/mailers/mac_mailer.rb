class MacMailer < ApplicationMailer

  default from: "notifications@macmccain.com"

  def contact(name, email, subject, message)
    @name = name
    @email = email
    @message = message

    mail(to: "bpwalford@gmail.com", subject: subject)
  end

  def donation_received(donation)
    @name = (donation.full_name == " ") ? "Anonymous" : donation.full_name.strip
    @message = donation.message
    @amount = donation.amount

    mail(to: "bpwalford@gmail.com", subject: "Donation Received!")
  end

end
