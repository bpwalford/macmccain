class PagesController < ApplicationController

  def index
  end

  def contact
  end

  def notify
    name    = params[:contact][:name]
    email   = params[:contact][:email]
    subject = params[:contact][:subject]
    message = params[:contact][:message]

    if MacMailer.contact(name, email, subject, message).deliver_now
      redirect_to contact_path, notice: "message successfully sent"
    else
      redirect_to contact_path, notice: "Error occurred sending message, try again later"
    end
  end

end
