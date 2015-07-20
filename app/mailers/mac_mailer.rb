class MacMailer < ApplicationMailer

  default from: "notifications@macmccain.com"

  def contact(name, email, subject, message)
    @name = name
    @email = email
    @message = message
    # macmccain441@gmail.com
    mail(to: "macmccain441@gmail.com", subject: subject)
  end

  def donation_received(donation)
    @name = (donation.full_name == " ") ? "Anonymous" : donation.full_name.strip
    @message = donation.message
    @amount = donation.amount

    # macmccain441@gmail.com
    mail(to: "macmccain441@gmail.com", subject: "Donation Received!")
  end

end
