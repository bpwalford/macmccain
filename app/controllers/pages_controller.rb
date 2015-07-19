class PagesController < ApplicationController

  def index
  end

  def contact
  end

  def donate
    @donation = Donation.new
  end

  def process_donation
    @donation = Donation.new(donation_params)

    if @donation.save
      redirect_to paypal_url(@donation)
    else
      render :donate
    end
  end

  def thank_you
    if params[:process] == Rails.application.secrets.payment_success
      donation = Donation.find(params[:id])
      MacMailer.donation_received(donation).deliver_now
    end

    redirect_to albums_path
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

  private

  def paypal_url(donation)
    app_host = Rails.application.secrets.app_host
    paypal_host = Rails.application.secrets.paypal_host
    payment_success = Rails.application.secrets.payment_success

    values = {
        business: Rails.application.secrets.paypal_business ,
        cmd: "_xclick",
        upload: 1,
        return: "#{app_host}/#{thank_you_path}?id=#{donation.id}&process=#{payment_success}",
        amount: donation.amount.to_f,
        item_name: "Donation",
        item_number: donation.id,
        quantity: '1'
    }
    "#{paypal_host}/cgi-bin/webscr?" + values.to_query
  end

  def donation_params
    params.require(:donation).permit(:first_name, :last_name, :message, :amount)
  end

end
