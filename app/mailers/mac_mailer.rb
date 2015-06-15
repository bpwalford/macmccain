class MacMailer < ApplicationMailer

  default from: "notifications@macmccain.com"

  def contact(name, email, subject, message)
    @name = name
    @email = email
    @message = message

# TODO this should be macs address
    mail(to: "bpwalford@gmail.com", subject: subject)
  end

end
